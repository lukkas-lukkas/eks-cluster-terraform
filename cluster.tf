resource "aws_eks_cluster" "resourse_cluster" {
  name     = "${var.project_name}_cluster"
  role_arn = aws_iam_role.resourse_role.arn

  vpc_config {
    subnet_ids = [
      aws_default_subnet.resource_subnet_1.id,
      aws_default_subnet.resource_subnet_2.id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.resource_policy_AmazonEKSClusterPolicy
  ]
}

output "endpoint" {
  value = aws_eks_cluster.resourse_cluster.endpoint
}

output "kubeconfigCertificateAuthorityData" {
  value = aws_eks_cluster.resourse_cluster.certificate_authority[0].data
}