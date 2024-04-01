variable "allowed_repos_branches" {
  description = "GitHub repos/branches allowed to asuume the IAM role."
  type = list(object({
    org = string
    repo = string
    branch = string
  }))
  # Example:
  # allowed_repos_branches = [
  #   {
  #     org    = "jjorgemartin"
  #     repo   = "Terraform"
  #     branch = "main"
  #   }
  # ]
}

variable "name" {
  description = "The name used to namespace all the resources created by this module"
  type        = string
  default     = "github-actions-oidc-example"
}