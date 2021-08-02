variable "partner_name" {
  description = "Name of partner"
  type        = string
}

variable "resource_tags" {
  description = "Tags for AWS resources"
  type        = map(string)
  default = {
    OwnedBy     = "Terraform"
    cost-center = "data-sharing"
    source      = "https://github.com/lexicoder/liveintent-assessment"
  }
}
