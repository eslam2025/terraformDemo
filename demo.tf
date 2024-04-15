provider "aws" {
  region     = "eu-west-3"
  //set same region in aws cli
  //access_key = ""
  //secret_key = ""
  //used >  export AWS_SECRET_ACCESS_KEY=........
  //                                               > for local usage within one terminal
  //used >  export AWS_ACCESS_KEY_ID=............      
  //used >  amazon cli > aws config to set these values (for global usage within any terminal)
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {

  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "eu-west-3a"
  tags = {
    Name = "subnet1"
  }

}

data "aws_vpc" "existing_vpc"{

  default =  true
}

resource "aws_subnet" "subnet2"{
  
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/20"
  tags = {
    Name = "subnet2"
  }

}

output "vpc_1_id" {

  value = aws_vpc.main.id
  
}

output "subnet_1_id" {

  value = aws_subnet.subnet1.id
  
}