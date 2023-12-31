resource "aws_ecs_service" "mongo" {
  name            = "mongodb"
  cluster         = aws_ecs_cluster.foo.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = 1
  iam_role        = "arn:aws:iam::108040610828:role/ecsTaskExecutionRole"
  

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

/*
  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "mongo"
    container_port   = 8080
  }
*/
  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  }
}