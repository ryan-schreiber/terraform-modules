
resource "github_actions_secret" "pypi_token" {
  repository       = github_repository.repo.name
  secret_name      = "PYPI_TOKEN"
  plaintext_value  = var.pypi_token
}
