# In Day 3 we will Learn Variable Block and Main Block
# In Variable -- here we will insert the values insted of giving main tf
# In Main -- here we configure resourse details

resource "aws_instance" "Shubhi" {
  ami    = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    name = "dikshuu"
  }
}