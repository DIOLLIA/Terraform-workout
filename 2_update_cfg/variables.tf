variable "container_name" {
  description = "Docker container name"
  type        = string
  default     = "Nginx-Test"
}

variable "nginx_exposed_port" {
  type    = number
  default = 8083
}