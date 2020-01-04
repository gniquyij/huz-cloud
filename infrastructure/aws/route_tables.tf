resource "aws_route_table" "huz_public_route" {
  vpc_id = "${aws_vpc.huz_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.huz_ig.id}"
  }
  tags = {
    Name = "huz_public_route"
  }
}

resource "aws_route_table" "huz_private_route" {
  vpc_id = "${aws_vpc.huz_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.huz_nat.id}"
  }
  tags = {
    Name = "huz_private_route"
  }
}

resource "aws_route_table_association" "huz_public_route"{
  subnet_id = "${aws_subnet.huz_public_subnet.id}"
  route_table_id = "${aws_route_table.huz_public_route.id}"
}

resource "aws_route_table_association" "huz_private_route_rds_1"{
  subnet_id = "${aws_subnet.huz_private_subnet_rds_1.id}"
  route_table_id = "${aws_route_table.huz_private_route.id}"
}

resource "aws_route_table_association" "huz_private_route_rds_2"{
  subnet_id = "${aws_subnet.huz_private_subnet_rds_2.id}"
  route_table_id = "${aws_route_table.huz_private_route.id}"
}
