variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    ap-south-1 = "ami-02eb7a4783e7e9317"
    ap-south-2 = "ami-02eb7a4783e7e9317"
  }
}

variable "USER" {
  default = "ubuntu"
}