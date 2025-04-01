variable "app_name" {
  type	  = string
  default = "my-app"
}

variable "db_host" {
  type	  = string
  default = "db.example.com"
}
 
data "template_file" "docker_compose" {
  template = file("docker-compose.tpl")
 
  vars = {
	app_name = var.app_name
	db_host  = var.db_host
  }
}
 
resource "local_file" "docker_compose_file" {
  filename = "docker-compose.yml"
  content  = data.template_file.docker_compose.rendered
}

