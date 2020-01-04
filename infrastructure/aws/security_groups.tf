resource "aws_security_group" "huz_nat_sg" {
  name = "huz_nat_sg"
  vpc_id = "${aws_vpc.huz_vpc.id}"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["${var.cidr_private_subnet_rds_1}"]
  }
  tags = {
    Name = "huz_nat_sg"
  }
}

resource "aws_security_group" "huz_sg" {
  name = "huz_sg"
  vpc_id = "${aws_vpc.huz_vpc.id}"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "huz_sg"
  }
}
