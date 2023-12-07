resource "helm_release" "auth" {
  chart   = "/home/saijiro/elo-helm/auth"
  name    = "auth"
  version = "1"
  cleanup_on_fail = true

}