provider "helm" {
  # Several Kubernetes authentication methods are possible: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#authentication
  kubernetes {
    config_path = pathexpand(var.kube_config)
  }
}

provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}

resource "helm_release" "example" {
  name = "my-local-chart"
  #   chart      = "./charts/example"
  # chart = "/home/testadmin/example/jenkins"
  chart = "/home/testadmin/elo-helm/jenkins"
  values = [
    "${file("jenkins-values.tpl.yaml")}"
  ]
  cleanup_on_fail = true

}