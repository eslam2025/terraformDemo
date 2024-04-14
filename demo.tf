provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAYS2NQOIP5LDJUOWP"
  secret_key = "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"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {


  vpc_id=aws_vpc.main.id
  cidr_block = "10.0.10.0/24"
  availability_zone = us-east-1a

}