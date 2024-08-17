# Set the required provider and versions
terraform {
  required_providers {
    # Recommend to point specific version of the Docker Provider
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

# Configure the docker provider
provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

# Create a docker image resource, eq to 'docker pull nginx:latest'
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

#Create a docker container resource, eq to 'docker run --name nginx -p8000:80 -d nginx:latest'
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx-tutorial"

  ports {
    internal = 80
    external = 8000
  }
}