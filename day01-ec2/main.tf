#Vpc Creation
resource "aws_vpc" "capge" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name= "capgemini"
  }
}
#Subnet Public Creation
resource "aws_subnet" "capge" {
  vpc_id = aws_vpc.capge.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "my-pub-sub1"
  }
}
#Subnet Private Creation
resource "aws_subnet" "Capge1" {
  vpc_id = aws_vpc.capge.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "my-pvt-sub2"
  }
}
#Creation of Security Group
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.capge.id
  name        = "allow_ssh"
  description = "Allow SSH access"
  tags = {
    Name = "modi"
  }

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#Creation of Key pair
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-key-pair"  # Change to your desired key name
  public_key = tls_private_key.my_key.public_key_openssh
}
#Instance Creation
resource "aws_instance" "capge" {
  ami           = "ami-078264b8ba71bc45e"  
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.id
  subnet_id     = "subnet-09bf9f50d79de4a7f"
  security_groups = [ "sg-0d89a06cea9f0025f" ]


  tags = {
    Name = "shubhipub"
  }
}
resource "aws_instance" "Capge1" {
  ami           = "ami-078264b8ba71bc45e"  
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.id
  subnet_id     = "subnet-0a5d8be36038cb1a4"
  security_groups = [ "sg-0d89a06cea9f0025f" ]


  tags = {
    Name = "shubhipvt"
  }
}
output "public_instance_ip" {
    value = aws_instance.capge.id
}

output "private_instance_id" {
  value = aws_instance.Capge1.id
}

output "private_key" {
  value     = tls_private_key.my_key.private_key_pem
  sensitive = true  
}

#Creation OF Internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.capge.id  # Attach the Internet Gateway to your VPC
  tags = {
    Name = "MyInternetGateway"
  }
}

#Creation Of Route 
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.capge.id  
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "MyRouteTable"
  }
}






