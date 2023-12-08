# resource "helm_release" "jenkins" {
#   chart   = "/home/saijiro/elo-helm/jenkins"
#   name    = "jenkins"
#   version = "1"

#   cleanup_on_fail = true

#   values = [templatefile("${path.module}/jenkins.values.yml.tpl", {
#     rg = var.resource_group_name
#     location = var.location
#   })]
# }

resource "helm_release" "prometheus" {
  chart   = "/home/saijiro/elo-helm/prometheus"
  name    = "prometheus"
  version = "1"

  cleanup_on_fail = true
}

resource "helm_release" "grafana" {
  chart   = "/home/saijiro/elo-helm/grafana"
  name    = "grafana"
  version = "2"

  cleanup_on_fail = true
}