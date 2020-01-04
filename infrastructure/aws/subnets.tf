resource "aws_subnet" "huz_public_subnet" {
  availability_zone = "ap-northeast-1a"
  cidr_block = "${var.cidr_public_subnet}"
  vpc_id = "${aws_vpc.huz_vpc.id}"
  tags = {
    Name = "huz_public_subnet"
  }
}

resource "aws_subnet" "huz_private_subnet_rds_1" {
  availability_zone = "ap-northeast-1a"
  cidr_block = "${var.cidr_private_subnet_rds_1}"
  vpc_id = "${aws_vpc.huz_vpc.id}"
  tags = {
    Name = "huz_private_subnet_rds_1"
  }
}

resource "aws_subnet" "huz_private_subnet_rds_2" {
  availability_zone = "ap-northeast-1c"
  cidr_block = "${var.cidr_private_subnet_rds_2}"
  vpc_id = "${aws_vpc.huz_vpc.id}"
  tags = {
    Name = "huz_private_subnet_rds_2"
  }
}
