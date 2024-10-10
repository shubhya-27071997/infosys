variable "ami_id" {
    description = "Inserting values to main.tf"
    type = string
    default = "ami-078264b8ba71bc45e"
  
}
variable "instance_type" {
  description = "Inserting type to main.tf"
  type = string
  default = "t2.micro"
}
variable "key_name" {
  description = "Inserting key type to main.tf "
  type = string
  default = "aws_key"
}