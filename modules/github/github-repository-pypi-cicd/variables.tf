
variable "git_token" {
  type    = string
  description = "The personal Git token for the owner of this repository."
  validation {
    condition     = length(var.git_token) == 40
    error_message = "Please provide a valid git token, length 40 characters."
  }
}

variable "project_name" {
  type        = string
  description = "The name of your project, restricted to only [A-Za-z0-9_]"
  validation {
    condition     = length(var.project_name) > 4 && can(regex("^[A-Za-z0-9_]$", var.project_name))
    error_message = "The project_name value cannot be an empty string, and restricted to only [A-Za-z0-9_] characters."
  }
}

variable "project_description" {
  type        = string
  description = "An optional, short description for your package."
  default     = " "
}

variable "pypi_token" {
  type        = string
  description = "A PYPI token for the account you want to publish your package to."
  validation {
    condition     = length(var.pypi_token) == 172 && substr(var.pypi_token, 0, 5) == "pypi-"
    error_message = "The pypi_token value must be a valid PYPI token starting with \"pypi-\"."
  }
}
