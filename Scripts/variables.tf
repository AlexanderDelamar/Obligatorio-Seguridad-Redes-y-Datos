#### Variables para logeo en AWS ####
variable "regionProvider" {
  type        = string
  description = "Declaracion de region provider"
  default     = "us-east-1"
}
variable "perfil" {
  type        = string
  description = "Declaracion de perfil provider"
  default     = "default"
}
#### Variables para VPC ####
variable "nombreVPC" {
  type        = string
  description = "Declaracion nombre VPC"
  default     = "OBLI-SRD-VPC"
}
variable "bloqueVPC" {
  type        = string
  description = "Declaracion VPC"
  default     = "192.168.0.0/16"
}
variable "bloqueSubnet1" {
  type        = string
  description = "Declaracion subnet publica1"
  default     = "192.168.1.0/24"
}
variable "bloqueSubnet2" {
  type        = string
  description = "Declaracion subnet publica2"
  default     = "192.168.2.0/24"
}
variable "nombrePublic1" {
  type        = string
  description = "Declaracion nombre Subnet1"
  default     = "OBLI-SRD-subnet-public1"
}
variable "nombrePublic2" {
  type        = string
  description = "Declaracion nombre Subnet2"
  default     = "OBLI-SRD-subnet-public2"
}
variable "AZ1" {
  type        = string
  description = "Declaracion Availability Zone"
  default     = "us-east-1a"
}
variable "AZ2" {
  type        = string
  description = "Declaracion Availability Zone"
  default     = "us-east-1b"
}
variable "nombreGW" {
  type        = string
  description = "Declaracion nombre Default gateway"
  default     = "OBLI-SRD-GW"
}
variable "nombreRT" {
  type        = string
  description = "Declaracion nombre Tabla de rutas publica"
  default     = "OBLI-SRD-PublicRT"
}
#### Variables para Grupo de Seguridad ####
variable "nomSG" {
  type        = string
  description = "Grupo de seguridad"
  default     = "obli-SG-EKS"
}
variable "nomSG-RDS" {
  type        = string
  description = "Grupo de seguridad para RDS"
  default     = "obli-SG-RDS"
}
#### Variables para Cluster EKS ####
variable "eksName" {
  type        = string
  description = "Nombre EKS"
  default     = "obli-EKS-Wordpress"
}
variable "nodegroupName" {
  type        = string
  description = "Declaracion nombre de node group"
  default     = "Obli-Node-Wordpress"
}
variable "tipoAMI" {
  type        = string
  description = "Declaracion de AMI"
  default     = "AL2_x86_64"
}
variable "capacidadInst" {
  type        = string
  description = "Declarion de capacidad de instancia"
  default     = "ON_DEMAND"
}
variable "tipoInst" {
  type        = string
  description = "Declaracion de tipo de instancia"
  default     = "t3.medium"
}
variable "capInst" {
  type        = number
  description = "Capacidad de instancias"
  default     = 2
}
variable "tamMax" {
  type        = number
  description = "Maximo instancias"
  default     = 2
}
variable "tamMin" {
  type        = number
  description = "Minimo instancias"
  default     = 2
}
variable "maxInhabilitadas" {
  type        = number
  description = "Maximo instancias inhabilitadas"
  default     = 1
}
#### Variables para RDS ####
variable "engineWP" {
  type        = string
  description = ""
  default     = "mysql"
}
variable "version-engineWP" {
  type        = number
  description = ""
  default     = "5.7"
}
variable "clase-instanciaWP" {
  type        = string
  description = ""
  default     = "db.t2.micro"
}
variable "allocated-storagedWP" {
  type        = number
  description = ""
  default     = "10"
}
variable "tipo-storageWP" {
  type        = string
  description = ""
  default     = "gp2"
}
variable "nameWP" {
  type        = string
  description = ""
  default     = "obli-wordpress"
}
variable "usernameWP" {
  type        = string
  description = ""
  default     = "administrator"
}
variable "passWP" {
  type        = string
  description = ""
  default     = "redhat1234"
}
variable "group-nameWP" {
  type        = string
  description = ""
  default     = "default.mysql5.7"
}
variable "nomDBInstance" {
  type        = string
  description = ""
  default     = "Wordpress DB"
}