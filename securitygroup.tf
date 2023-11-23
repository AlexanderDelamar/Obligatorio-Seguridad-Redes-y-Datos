# Creamos grupo de seguridad para el cluster de eks
resource "aws_security_group" "obli-EKS-SG" {
  name   = var.nomSG
  vpc_id = aws_vpc.obli-VPC.id

# Se permite ingreso SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Permite trafico HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Permite trafico HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.nomSG
  }
}

# Creamos grupo de seguridad para la instancia de RDS
resource "aws_security_group" "obli-RDS-SG" {
  name = var.nomSG-RDS
  vpc_id = aws_vpc.obli-VPC.id

# Se habilita puerto de MySQL para acceder remotamente
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.nomSG-RDS
  }
}