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
  args = "storage blob upload-batch -d \\$web --account-name hugoblog -s .testblog/public"
  secrets = ["AZURE_SERVICE_APP_ID", "AZURE_SERVICE_TENANT", "AZURE_SERVICE_PASSWORD"]
}
