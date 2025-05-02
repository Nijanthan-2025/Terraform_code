variable "ami_id" {
  description = "AMI ID to use for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the instance"
  type        = string
}

variable "ebs_size" {
  description = "Size of the EBS volume in GB"
  type        = number
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "name" {
  description = "Name tag for the instance"
  type        = string
}
