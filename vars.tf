variable "region" {
  type        = "string"
  description = "Choose the region"
  default     = "us-east-1"
}

variable "web_ami" {
    default  = "ami-07d0cf3af28718ef8"
  }

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ec2_keyname" {
  default = "ALL"
}

variable "max_size" {
  default = "2"
}

variable "min_size" {
  default = "1"
}

variable "desired_capacity" {
  default = "1"
}

variable "security_group" {
  default = "sg-"
}

variable "subnet" {
  default = "subnet-"
}
