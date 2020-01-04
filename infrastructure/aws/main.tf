provider "aws" {
  profile = "default"
  region = "${var.region_name}"
  version = "2.41.0"
}

resource "aws_vpc" "huz_vpc" {
  cidr_block = "${var.cidr}"
  tags = {
    Name = "huz_vpc"
  }
}

resource "aws_instance" "huz_instance" {
  ami = "${var.ami_id}"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  user_data = "${file("bootstrap.sh")}"
  subnet_id = "${aws_subnet.huz_public_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.huz_sg.id}"]
  tags = {
    Name = "huz_instance"
  }
}
