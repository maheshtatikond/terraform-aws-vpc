variable "project" {
    description = "The name of the project."
    type        = string
  
}
variable "environment" {
  description = "The name of the environment."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
  
}

variable "vpc_tags"{
    description = "Additional tags to apply to the VPC."
    type        = map(string)
    default     = {}
}
variable "igw_tags" {
  description = "Additional tags to apply to the Internet Gateway."
  type        = map(string)
  default     = {}
}