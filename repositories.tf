resource "aws_ecr_repository" "projectx_ms_store_repository_resource" {
  name                 = "project-x-ms-store"
}

resource "aws_ecr_repository" "projectx_ms_fraud_repository_resource" {
  name                 = "project-x-ms-fraud"
}
