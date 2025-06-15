resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = [
    "subnet-014305d3713453d06",
    "subnet-021fd075d1faedfb1",
    "subnet-0ae84b4dee2de0fa7"
  ]

  tags = {
    Name = "My RDS subnet group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier        = "mysql-db"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  username          = "admin"
  password          = "MySecurePass123!"  # Store securely later
  allocated_storage = 20
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot   = true
  publicly_accessible   = false
  multi_az              = false
}

resource "aws_db_instance" "postgres" {
  identifier        = "postgres-db"
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"
  username          = "pgadmin"
  password          = "MySecurePass123!"  # Store securely later
  allocated_storage = 20
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot   = true
  publicly_accessible   = false
  multi_az              = false
}
