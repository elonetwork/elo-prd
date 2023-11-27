resource "helm_release" "yaml_file_2" {
  chart   = "/home/saijiro/elo-helm/test"
  name    = "test"
  version = "1"
  cleanup_on_fail = true

}