# variable "key_name" {
#   description = "SSH key name in your AWS account for AWS instances."
# }
#
# variable "key_path" {
#   description = "Path to the private key specified by key_name."
# }

variable "region" {
  default     = "us-east-1"
}

variable "username" {
  default = "centos"
}

variable "ami" {
  # default = "ami-cd0f5cb6"  # Base
  default = "ami-dd1238a6"  # Built AMI
}

variable "instance_type" {
  default     = "p2.xlarge"
}

variable "tagName" {
  default     = "gpu-test"
}

variable "volume_type" {
  default     = "io1"
}

variable "volume_size" {
  default     = "200"
}

variable "iops" {
  default     = "1000"
}
