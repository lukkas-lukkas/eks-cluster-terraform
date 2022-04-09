resource "aws_iam_role" "resourse_role" {
  name = "${var.project_name}_role"

  assume_role_policy = jsonencode({
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "eks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
    "Version": "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "resource_policy" {
  policy_arn = "arn:aws:iam::aws:policy/resource_policy"
  role       = aws_iam_role.resourse_role.name
  depends_on = [
    aws_iam_role.resourse_role
  ]
}