variable "name" {
  default = "nlb"
}

variable "subnets" {
  description = "A list of subnets for LB"
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "is_internal" {
  description = "Internal LB flag"
  default     = false
}

variable "port" {
  description = "LB port"
  default     = 8080
}

variable "target_group_arn" {
  description = "Target Group Arn for default route action"
}

variable "sns_topic_arn" {
  description = "SNS topic arn to use in alarms"
}

variable "tcp_client_resets" {
  description = "TCP_Client_Reset_Count alarm treshold"
  default     = 10
}

variable "tcp_target_resets" {
  description = "TCP_Target_Reset_Count alarm treshold"
  default     = 10
}

variable "tcp_elb_resets" {
  description = "TCP_ELB_Reset_Count alarm treshold"
  default     = 150
}

variable "lb_processed_bytes" {
  description = "ProcessedBytes alarm treshold"
  default     = 50000000
}

variable "active_flow_count" {
  description = "ActiveFlowCount alarm treshold"
  default     = 100
}

variable "new_flow_count" {
  description = "NewFlowCount alarm treshold"
  default     = 200
}
