resource "aws_db_instance" "default" {
  identifier           = "demo-rds"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = data.aws_ssm_parameter.dummyref.value
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = "true"
}


data "aws_ssm_parameter" "dummyref" {
  name = "secretdemo"
}