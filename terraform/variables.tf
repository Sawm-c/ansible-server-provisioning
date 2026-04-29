variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name used as prefix for all resource tags"
  type        = string
  default     = "ansible-provisioning"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the AWS EC2 Key Pair to allow SSH access (must already exist in AWS)"
  type        = string
}
