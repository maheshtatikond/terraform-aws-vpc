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
variable "public_subnet_cidrs" {
 type = list(string)
 default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "public_subnet_tags" {
  description = "Additional tags to apply to the public subnets."
  type        = map(string)
  default     = {}
}