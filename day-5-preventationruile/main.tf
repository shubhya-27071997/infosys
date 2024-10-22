# Define the EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0ddc798b3f1a5117e" 
  instance_type = "t2.micro"
  key_name = "aws_key"
 
 disable_api_termination = true   # by using this we can't delete instance manullay

 lifecycle {
   ignore_changes = [ instance_type ] # if we stop we can't start manullay
 }

  tags = {
    Name = "Terraform-Example"
  }
}

resource "null_resource" "name" {
  
}

