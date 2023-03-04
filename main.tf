module "ec2module" {
  source  = "./mymodule/modules"
  tagName = var.tagName
}
