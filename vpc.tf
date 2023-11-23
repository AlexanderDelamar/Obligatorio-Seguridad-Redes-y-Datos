# Creacion VPC
resource "aws_vpc" "obli-VPC" {
  cidr_block           = var.bloqueVPC
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.nombreVPC
  }
}
# Creacion de subnets 
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.obli-VPC.id
  cidr_block              = var.bloqueSubnet1
  availability_zone       = var.AZ1
  map_public_ip_on_launch = "true"

  tags = {
    Name = var.nombrePublic1
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.obli-VPC.id
  cidr_block              = var.bloqueSubnet2
  availability_zone       = var.AZ2
  map_public_ip_on_launch = "true"

  tags = {
    Name = var.nombrePublic2
  }
}

# Agrupacion de subnets para RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "rds-subnet-group"
  subnet_ids = [aws_subnet.public1.id,aws_subnet.public2.id]
}

# Se crea gateway para tener conexion a internet en instancias
resource "aws_internet_gateway" "obli-GW" {
  vpc_id = aws_vpc.obli-VPC.id

  tags = {
    Name = var.nombreGW
  }
}

# Creacion de tablas de rutas por defecto para instancias
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.obli-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.obli-GW.id
  }

  tags = {
    Name = var.nombreRT
  }
}

# Asocia la tabla de rutas con las subnets 
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_route_table.id
}