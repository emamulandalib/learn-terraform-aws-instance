variable "region" {
  default = "us-east-1"
}

variable "amis" {
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-0ba8629bff503c084"
  }
}