resource "aws_internet_gateway" "huz_ig" {
  vpc_id = "${aws_vpc.huz_vpc.id}"
  tags = {
    Name = "huz_ig"
  }
}

resource "aws_instance" "huz_nat" {
  ami = "ami-00d29e4cb217ae06b"
  associate_public_ip_address = true
  availability_zone = "ap-northeast-1a"
  instance_type = "t2.nano"
  key_name = "${var.key_name}"
  subnet_id = "${aws_subnet.huz_public_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.huz_nat_sg.id}"]
  tags = {
    Name = "huz_nat"
  }
}

resource "aws_eip" "huz_eip_nat" {
  instance = "${aws_instance.huz_nat.id}"
  vpc = true
}
