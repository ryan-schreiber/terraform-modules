
resource "github_repository" "repo" {
  name             = var.project_name
  description      = var.project_description
  visibility       = "public"
  auto_init        = true
  license_template = "mit"
}

