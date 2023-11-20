resource "helm_release" "example" {
  name       = "my-release"
  chart      = "/home/adminuser/elo-prd/Terraform/cluster_compnents/az-file/az-file"
}