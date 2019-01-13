workflow "New workflow" {
  on = "push"
  resolves = [
    "Build Hugo content",
    "GitHub Action for Azure",
  ]
}

action "Build Hugo content" {
  uses = "./hugo-build-action"
}

action "GitHub Action for Azure" {
  needs = ["Build Hugo content"]
  uses = "actions/azure@4919f1449100fb0e6111a52466de7f2a1dc861dc"
  secrets = ["AZURE_APP_ID", "AZURE_SP_NAME", "AZURE_SP_PASSWORD", "AZ_SP_TENANT"]
  args = "storage blob upload-batch -d $web --account-name hugoblog -s .testblog/public"
}
