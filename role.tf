resource "aws_iam_role" "resourseRole" {
  name = "${var.projectName}-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "resourcePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/resourcePolicy"
  role       = aws_iam_role.resourseRole.name
}