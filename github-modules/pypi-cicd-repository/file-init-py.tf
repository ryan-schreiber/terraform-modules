
resource "github_repository_file" "init" {
  repository = github_repository.repo.name
  branch     = "main"
  file       = "${var.project_name}/__init__.py"
  content    = " "
}
