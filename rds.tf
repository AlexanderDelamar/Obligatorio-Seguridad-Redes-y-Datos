# Creacion de la instancia de RDS
resource "aws_db_instance" "wordpressTest" {
  engine                 = var.engineWP
  engine_version         = var.version-engineWP
  instance_class         = var.clase-instanciaWP
  allocated_storage      = var.allocated-storagedWP
  storage_type           = var.tipo-storageWP
  db_name                = var.nameWP
  username               = var.usernameWP
  password               = var.passWP
  parameter_group_name   = var.group-nameWP
  publicly_accessible    = true
  skip_final_snapshot    = true
  
  identifier = "wordpress-database"

  vpc_security_group_ids = [aws_security_group.obli-RDS-SG.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  tags = {
    name = var.nomDBInstance
  }
}