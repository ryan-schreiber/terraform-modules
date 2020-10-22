
provider "github" {
  token = var.git_token
}

terraform {
  experiments = [variable_validation]
}
