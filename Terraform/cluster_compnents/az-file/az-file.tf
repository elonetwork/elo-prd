resource "helm_release" "example" {
  name       = "my-release"
  chart      = "/home/adminuser/elo-helm/az-file"
}