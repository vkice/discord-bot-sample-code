variable "region" {
  type = string
}

variable "bitbucket_role_name" {
  type = string
}

variable "repository_uuid" {
  type = string
}

variable "oidc_url" {
  type = string
}

variable "client_id" {
  type = list(string)
}

variable "thumbprint_list" {
  type = list(string)
}

variable "bitbucket_public_ips" {
  type = list(string)
}
