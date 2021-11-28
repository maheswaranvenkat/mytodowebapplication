resource "kubernetes_deployment" "mytodowebapplication" {
  metadata {
    name = "mytodowebapplication"
    labels = {
      app = "mytodowebapplication"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mytodowebapplication"
      }
    }

    template {
      metadata {
        labels = {
          app = "mytodowebapplication"
        }
      }

      spec {
        container {
          image = "maheswaranvenkat/mytodowebapplication:0.0.1-SNAPSHOT"
          name  = "mytodowebapplication-container"
          volume_mount {
            name       = "mytodowebapplication-vol"
            mount_path = "/data"
          }
        }
        volume {
          name = "nodered-vol"
          empty_dir {
            medium = ""
          }
        }
      }
    }
  }
}