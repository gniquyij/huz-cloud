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

resource "aws_db_subnet_group" "huz_db_subnet_group" {
  name = "huz_db_subnet_group"
  subnet_ids = ["${aws_subnet.huz_private_subnet_rds_1.id}", "${aws_subnet.huz_private_subnet_rds_2.id}"]
  tags = {
    Name = "huz_db_subnet_group"
  }
}

resource "aws_db_instance" "huz_db" {
  allocated_storage = 20
  db_subnet_group_name = "${aws_db_subnet_group.huz_db_subnet_group.id}"
  engine = "postgres"
  engine_version = "11.5"
  instance_class = "db.t2.micro"
  name = "huz"
  password = "password"
  storage_type = "gp2"
  username = "huzer"
  vpc_security_group_ids = ["${aws_security_group.huz_nat_sg.id}"]
}
