# Variables de Cluster
eksName          = "obli-EKS-Wordpress"
nodegroupName    = "Obli-Node-Wordpress"
tipoAMI          = "AL2_x86_64"
capacidadInst    = "ON_DEMAND"
tipoInst         = "t3.medium"
capInst          = 1
tamMax           = 1
tamMin           = 1
maxInhabilitadas = 1
# Variables de VPC
nombreVPC      = "OBLI-SRD-VPC"
bloqueVPC      = "192.168.0.0/16"
bloqueSubnet1  = "192.168.1.0/24"
bloqueSubnet2  = "192.168.2.0/24"
nombrePublic1  = "OBLI-SRD-subnet-public1"
nombrePublic2  = "OBLI-SRD-subnet-public2"
AZ1            = "us-east-1a"
AZ2            = "us-east-1b"
nombreGW       = "OBLI-SRD-GW"
nombreRT = "OBLI-SRD-PublicRT"
# Variables Security Group
nomSG     = "obli-EKS-SG"
nomSG-RDS = "obli-SG-RDS"
# Variables RDS
engineWP             = "mysql"
version-engineWP     = "5.7"
clase-instanciaWP    = "db.t2.micro"
allocated-storagedWP = "10"
tipo-storageWP       = "gp2"
nameWP               = "obliWordpress"
usernameWP           = "administrator"
passWP               = "redhat1234"
group-nameWP         = "default.mysql5.7"
# Tags RDS
nomDBInstance        = "Wordpress"