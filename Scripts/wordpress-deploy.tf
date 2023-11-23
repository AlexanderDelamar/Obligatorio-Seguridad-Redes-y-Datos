# // se crea deployment de wp, se asignan variables de entorno para mysql
resource "kubernetes_deployment" "wordpress" {
  metadata {
    name = "wordpress"
    labels = {
      app = "wordpress"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "wordpress"
        tire = "frontend"
      }
    }
    template {
      metadata {
        labels = {
          app = "wordpress"
          tire = "frontend"
        }
      }
      spec {
        container {
          image = "wordpress:6.3.2-php8.0-apache"
          name  = "wordpress"
          env {
            name  = "WORDPRESS_DB_HOST"
            value = aws_db_instance.wordpressTest.address
          }
          env {
            name  = "WORDPRESS_DB_USER"
            value = aws_db_instance.wordpressTest.username
          }
          env {
            name  = "WORDPRESS_DB_PASSWORD"
            value = aws_db_instance.wordpressTest.password
          }
          env {
            name  = "WORDPRESS_DB_NAME"
            value = aws_db_instance.wordpressTest.db_name
          }
          port {
            container_port = 80
            name = "wordpress"
          }
        }  
      }
    }
  }
}

# Creacion lb
resource "kubernetes_service" "wordpress" {
  metadata {
    name = "wordpress"
    labels = {
      app = kubernetes_deployment.wordpress.metadata.0.labels.app
    }
  }
  spec {
    selector = {
      app = "wordpress"
      tire = "frontend"     
    }
    port {
      port = 80
    }
    type = "LoadBalancer"
  }
}