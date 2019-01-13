workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Azure"]
}

action "GitHub Action for Azure" {
  uses = "actions/azure@4919f1449100fb0e6111a52466de7f2a1dc861dc"
  secrets = ["AZURE_APP_ID", "AZURE_SP_NAME", "AZURE_SP_PASSWORD", "AZ_SP_TENANT"]
}
