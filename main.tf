terraform {
  backend "pg" {} # connection from PG_CONN_STR, schema per target
}

variable "policies" { type = list(string) }

resource "terraform_data" "policy" {
  for_each = toset(var.policies)
  input    = each.key
}
