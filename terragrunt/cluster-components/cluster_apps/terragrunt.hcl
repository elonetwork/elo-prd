include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../terraform/cluster-components//cluster_apps"
}

dependencies{
  paths = ["../../infrastructure"]
}

dependency "infrastructure" {
  config_path  = "../../infrastructure"
}

inputs = {

}
