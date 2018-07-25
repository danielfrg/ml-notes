# Fill these variables in the local.tf

# variable "key_name" {
#   description = "SSH key name in your AWS account for AWS instances"
#   default = ""
# }

# variable "key_path" {
#   description = "Path to the private key specified by key_name"
#   default = ""
# }

###############################################################################

variable "region" {
  default = "us-east-1"
}

variable "username" {
  default = "ubuntu"
}

variable "ami" {
  default = "ami-5cc39523" # 18.04 Base

  # default = "ami-41e0b93b" # 16.04 Base

  # default = ""  # Built AMI
}

variable "instance_type" {
  default = "p2.xlarge"
}

variable "tagName" {
  default = "daniel-gpu-test"
}

variable "volume_type" {
  default = "io1"
}

variable "volume_size" {
  default = "1000"
}

variable "iops" {
  default = "1000"
}
