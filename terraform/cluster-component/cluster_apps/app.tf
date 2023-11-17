resource "helm_release" "yaml_file_1" {
    chart = "ingress"
    name = "ingress"
    values = ["./yaml/ingress.yaml"]
    version = "1"
}