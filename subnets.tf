resource "aws_default_subnet" "resource_subnet_1" {
  availability_zone = "${var.aws_region}a"
}

resource "aws_default_subnet" "resource_subnet_2" {
  availability_zone = "${var.aws_region}b"
}