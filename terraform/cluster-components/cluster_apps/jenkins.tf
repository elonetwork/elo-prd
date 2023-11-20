resource "helm_release" "yaml_file_1" {
  chart   = "/home/saijiro/elo-helm/jenkins"
  name    = "jenkins"
  version = "1"

  cleanup_on_fail = true
#   values          = [templatefile("${path.module}/jenkins.values.yml.tpl",{})]

}

