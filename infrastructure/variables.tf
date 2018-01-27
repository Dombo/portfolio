# r53-alias
variable domain {}
variable target {}
variable route53_zone_id {}
variable cdn_hosted_zone_id {}

# r53-cname
variable domain {}
variable target {}
variable route53_zone_id {}

# site-main
variable region {
  default = "us-east-1"
}

variable project {
  default = "noproject"
}
variable environment {
  default = "default"
}

variable domain {}

variable bucket_name {
  description = "The name of the S3 bucket to create."
}

variable duplicate-content-penalty-secret {}
variable deployer {}
variable acm-certificate-arn {}

variable routing_rules {
  default = ""
}

variable not-found-response-path {
  default = "/404.html"
}

variable "tags" {
  type        = "map"
  description = "Optional Tags"
  default     = {}
}

variable "trusted_signers" {
  type = "list"
  default = []
}

variable "forward-query-string" {
  description = "Forward the query string to the origin"
  default     = false
}

# site-redirect

variable region {
  default = "us-east-1"
}

variable project {
  default = "noproject"
}
variable environment {
  default = "default"
}

variable domain {}
variable target {}
variable duplicate-content-penalty-secret {}
variable deployer {}
variable acm-certificate-arn {}

variable "tags" {
  type        = "map"
  description = "Optional Tags"
  default     = {}
}
