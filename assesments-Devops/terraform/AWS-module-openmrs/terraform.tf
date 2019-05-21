variable "aws_access_key" {
   type    = "string" 
    default = " "
}
variable "aws_secret_key" {
    default = " "
    type    = "string"
}
variable "aws_region" {
    default = "ap-south-1"
    type    = "string"
}
variable "aws_ami"{
    default ="ami-0a574895390037a62"
    type    = "string"
}
variable "aws_key" {
    default ="mynewkeypair"
    type    = "string"
}

variable "aws_instancetype"{
    default = "t2.micro"
}

variable "aws_connectiontype"{
    default = "ssh"
}

variable "aws_user" {
    default = "ubuntu"
}

variable "aws_VPCcidr"{
    default = "172.168.0.0/20"
}
variable "aws_subnetcidr"{
    default = "172.168.1.0/24"
}

