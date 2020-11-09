
provider "github" {
  token = variables.token
}

resource "github_user_ssh_key" "example" {
  title = "test key"
  key   = "${file("C://Users/schreibr/.ssh/id_rsa.pub")}"
}
