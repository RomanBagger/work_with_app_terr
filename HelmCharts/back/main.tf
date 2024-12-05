provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "medfast-backend" {
  name       = "medfast-backend"
  chart      = "${path.module}/backendapp"
  namespace  = "default"

  values = [
    file("${path.module}/backendapp/values.yaml")
  ]
}
