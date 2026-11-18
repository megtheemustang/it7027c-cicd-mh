terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.7.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_container" "web" {
  name  = "it7027c-web"
  image = docker_image.nginx.image_id
}
