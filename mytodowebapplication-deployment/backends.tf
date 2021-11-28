terraform {
  backend "remote" {
    organization = "npl-terraform"

    workspaces {
      name = "mtc-k8s"
    }
  }
}