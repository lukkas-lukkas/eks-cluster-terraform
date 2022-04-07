resource "aws_eks_cluster" "resourseCluster" {
  name     = "${var.projectName}Cluster"
  role_arn = aws_iam_role.resourseRole.arn

  vpc_config {
    subnet_ids = [aws_subnet.resourceSubnet1.id, aws_subnet.resourceSubnet2.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.resourcePolicy
  ]
}

output "endpoint" {
  value = aws_eks_cluster.resourseCluster.endpoint
}

output "kubeconfigCertificateAuthorityData" {
  value = aws_eks_cluster.resourseCluster.certificate_authority[0].data
}