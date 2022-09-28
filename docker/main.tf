terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
}

provider "docker" {
  # Configuration options
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "hello-terraform"
  ports {
    internal = 80
    external = 8080
  }
}