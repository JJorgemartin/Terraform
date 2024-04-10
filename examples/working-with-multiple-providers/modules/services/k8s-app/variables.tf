variable "name" {
  description = "The name to use for all resources created by this module"
  type        = string
}

variable "image" {
  description = "The Docker image to run"
  type        = string
}

variable "container_port" {
  description = "The port the Docker image listens on"
  type        = number
}

variable "replicas" {
  description = "Hoy many replicas to run"
  type        = number
}

variable "enviroment_variables" {
  description = "Environment variables to set for the app"
  type        = map(string)
  default     = {}
}