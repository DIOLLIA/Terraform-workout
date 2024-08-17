We are gonna to modify that resource we created before, and apply changes to the Terraform projects.
 
- [Modify resource](#modify_resource)
- [Input variables](#env_var)
- [Query data with outputs](#output)

### <a name="modify_resource">Modify resource</a>  
Apply deleted project again if it doesn't exist. 

Check that configuration state with command `tf show` 

Change the docker_container.nginx resource under the provider block in main.tf by replacing the ports.external value of 8000 with 8082

ensure that state is changed and check nginx is available on the new port.

### <a name="env_var">Input variables</a>  
It is a good practice to store variables in files or use environment variables instead of hardcoded values.

Create a file inside the working directory _variables.tf_ . Terraform loads all files in the current directory ending in *.tf .

Put there variable definition

```
variable "container_name" {
  description = "Docker container name"
  type        = string
  default     = "Nginx-Test"
}
variable "nginx_exposed_port" {
  type        = int
  default     = 8082 
}
```
Change in main.tf resource docker_container.nginx to use that variable
```
  name  = var.container_name
```

You will see that Terraform wants to apply that change 
![alt text](image.png)

### <a name="output">Query data with outputs</a>  

 Use of output values helps to organize data to be easily queried and displayed to the Terraform user.

 Create a file called outputs.tf in your working directory.

 put next definitions there

 ```
 output "container_name" {
  description = "Docker container name"
  value       = docker_container.nginx.name
}

 output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}
```
Use `tf output` to see that it provides nothing useful.

Now you should apply the updated configuration, and use `tf output` again. 
