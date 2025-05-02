variable "app_server" {
    description = "EC2 app server"
    type = list(object({
      name = string
      instance_type = string
      ebs_size = number
    }))
    default = [
        { name = "app_server-1", instance_type = "t3.micro", ebs_size = 1 },
        { name = "app_server-2", instance_type = "t3.micro", ebs_size = 1 }      
    ]
}

variable "db_instance" {
    description = "ec2 db instance"
    type = list(object({
      name = string
      instance_type = string
      ebs_size = number
    }))
  default = [
        { name = "app_server-1", instance_type = "t3.micro", ebs_size = 1 },
        { name = "app_server-2", instance_type = "t3.micro", ebs_size = 1 }      
     ]
}

variable "app_ami_id" {
    description = "ami id for app server"
    type = string
    default = "ami-0f5ee92e2d63afc18"
}

variable "db_ami_id" {
    description = "ami id for db"
    type = string
    default = "ami-0f5ee92e2d63afc18"
}

variable "key_name" {
    description = "EC key pair"
    type = string  
    default = ""
}

