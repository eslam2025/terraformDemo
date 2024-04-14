provider "aws" {
  region     = "eu-west-3"
  access_key = "AKIAYS2NQOIP5LDJUOWP"
  secret_key = "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"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {

  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "eu-west-3a"
  tags = {
    Name = subnet1
  }

}

data "aws_vpc" "existing_vpc"{

  default =  true
}

resource "aws_subnet" "subnet2"{
  
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/20"
  tags = {
    Name = subnet2
  }

}
