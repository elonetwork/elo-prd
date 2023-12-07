resource "helm_release" "auth" {
  chart   = "/home/saijiro/elo-helm/auth"
  name    = "auth"
  version = "1"
  cleanup_on_fail = true
}

resource "helm_release" "test" {
  chart   = "/home/saijiro/elo-helm/test"
  name    = "test"
  version = "1"
  cleanup_on_fail = true
}