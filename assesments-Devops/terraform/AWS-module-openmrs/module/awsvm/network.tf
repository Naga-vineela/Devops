
resource "aws_vpc" "VPCTF" {
  cidr_block = "${var.aws_VPCcidr}"

  tags {
    name = "terraformVPC"
  }
}

resource "aws_subnet" "SubnetTF" {
  cidr_block = "${var.aws_subnetcidr}"
  vpc_id     = "${aws_vpc.VPCTF.id}"

  #map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "TFiggw" {
  vpc_id = "${aws_vpc.VPCTF.id}"
}

resource "aws_route_table" "routeTF" {
  vpc_id = "${aws_vpc.VPCTF.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.TFiggw.id}"
  }
}

resource "aws_route_table_association" "RTSubnet" {
  subnet_id      = "${aws_subnet.SubnetTF.id}"
  route_table_id = "${aws_route_table.routeTF.id}"
}

resource "aws_security_group" "allow_all" {
  name   = "openall"
  vpc_id = "${aws_vpc.VPCTF.id}"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}