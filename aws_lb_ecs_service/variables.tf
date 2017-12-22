variable "name" {
  description = "Name of the service"
}

variable "cluster_id" {
  description = "A cluster id which will run this service"
}

variable "cluster_name" {
  description = "A cluster name used for alarms/metrics dimensions"
}

variable "task_definition" {
  description = "A task definition used to define containers configuration for the service"
}

variable "task_role_arn" {
  description = "A role assumed by tasks"
  default = ""
}

variable "target_group_arn" {
  description = "A target group arn connected to a listener on LB"
}

variable "desired_count" {
  description = "A number of tasks for the service"
  default = "1"
}

variable "container_port" {
  description = "Port number of the service/containers"
  default = "8080"
}

variable "service_memory" {
  description = "Memory limit for the service"
  default = "200"
}

variable "alarm_cpu_threshold" {
  default = 70
}

variable "alarm_memory_threshold" {
  default = 80
}

variable "sns_topic_arn" {}
