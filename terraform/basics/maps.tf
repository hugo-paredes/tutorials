terraform {
  backend "local" {}
}

variable "map" {
  type = map(string)

  default = {
    hello = "world"
  }
}
variable "map_object" {
  type = map(object({
    brand  = string
    model  = string
    new    = bool
    extras = list(string)
  }))

  default = {
    user1 = {
      brand  = "Renault"
      model  = "Megane"
      new    = true
      extras = [
        "Allow wheels", "Metallic paint"
      ]
    }
    user2 = {
      brand  = "Ferrari"
      model  = "LaFerrari"
      new    = false
      extras = [""]
    }
    user3 = {
      brand  = "Hyundai"
      model  = "IONIQ 5"
      new    = true
      extras = [""]
    }
  }
}

#output "map" {
#  value = var.map
#}
#output "map_object" {
#  value = var.map_object
#}
#output "length_map_object" {
#  value = length(var.map_object)
#}
output "complex" {
  value = {
  for k, v in var.map_object : k => v if length(v.extras) > 1
  }
}
