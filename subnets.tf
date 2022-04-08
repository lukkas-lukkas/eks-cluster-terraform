resource "aws_default_subnet" "resourceSubnet1" {
  availability_zone = "${var.awsRegion}a"
}

resource "aws_default_subnet" "resourceSubnet2" {
  availability_zone = "${var.awsRegion}b"
}