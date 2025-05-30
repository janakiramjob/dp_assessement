variable "aws_region" {
  default = "us-east-2"
}

variable "instance_type" {
  description = "EC2 instance type for Wazuh"
  default     = "t3.xlarge"
}

variable "instance_name" {
  description = "Name tag for the Wazuh instance"
  default     = "Wazuh Server"
}

variable "tf_state_bucket" {
  default = "my-terraform-state-bucket"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}


variable "tags" {
  type = map(string)
  default = {
    Project = "Wazuh Deployment"
    Owner   = "DevOps Team"
    Env     = "Dev"
  }
}
