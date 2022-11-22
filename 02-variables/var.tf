variable "sample" {       # How to declare Variable
  default = "hello"
}

# If Variable is not a Combination then var.sample, if its is combinig with any other string then ${var.sample}
output "sample" {         # Access the Variable
  value = var.sample      # calling variable
}

output "sample1" {
  value = "Hey, ${var.sample}"  #  attaching a string "hey" so use ${var.sample}
}

# String data type
variable "sample1" {
  default = "Hello World"
}

# Number data type
variable "sample2" {
  default = "100"
}

# Boolean data type
variable "sample3" {
  default = "true"
}

#List Variable
variable "sample4" {
  default = [
     "HELLO" ,
     100 ,
     true
  ]
}

#MAP Variable
variable "sample5" {
  default = {
    string  = "HELLO"
    number  = 100
    boolean = true
  }
}

## Access a list Value
output "sample4" {
  value = var.sample4[0] # [0] will give only output 1st string i.e hello
}