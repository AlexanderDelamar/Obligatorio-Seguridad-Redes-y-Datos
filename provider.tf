provider "aws" {
  region  = var.regionProvider
  profile = var.perfil
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "null_resource" "update_kubernetesconfig_aws" {
# Hacemos que se ejecute siempre que se ejecutan los scripts de terraform
  triggers = {
    always_run = "${timestamp()}"
  }

# Actualizamos el kubeconfig de manera local para poder acceder al cluster
  provisioner "local-exec" {
    command = "aws eks --region ${var.regionProvider} update-kubeconfig --name ${var.eksName}"
  }
  
  depends_on = [aws_eks_cluster.obli-EKS]
}