provider "aws" {
    default_tags {
        tags = {
        owner           = "Terraform"
        app             = "discord-bot"
        }
  }
}

