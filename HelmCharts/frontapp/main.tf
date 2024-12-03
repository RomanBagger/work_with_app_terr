provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "medfast-frontend" {
  name       = "medfast-frontend"
  chart      = "${path.module}/helm_chart"
  namespace  = "default"

  values = [
    file("${path.module}/helm_chart/values.yaml")
  ]
}
