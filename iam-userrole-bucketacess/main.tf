
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = var.MyRegion
}



/* Create iam user */

module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 4"

  create_user = true
  name = "nabeel"
  password_length = 12
  create_iam_access_key = true
  pgp_key = "mQENBGIRSj4BCACubjjiICn99Zjwp6By8N8oNM5/3R3tmW5YtJnSXIVV5P/SFrr9UE4zbdBnCBGCtryXaq9hfE0vc5tOd0k97wfz8ayfSnIPwr54HsOov5KC8bUDwVw6k7haCPzmVes1MJyJ80WIpH7xpBYcYhLVRxkf2/LseL1z/Qsw6QO+C4b1YYyUKfeEOlj3mN+sgeGGaMCKcAva19/p2fjOTttP1NOuUdj5XNCUKf0w11LpIShWYMkrV68b2dScFDAfu+CUU2emuOHaOdZSLewk/McXTj14Nhl2bX4SlGkR2RAtaNz1vjHwExqBU+sBj1gLNxtPKQQGiY9l3ZGjofDWUPNKCfiFABEBAAG0DWFmc0BnbWFpbC5jb22JARwEEAECAAYFAmIRSj4ACgkQtAXYOwOG0K05NAf/Z4ep8yVI9gqBs9R2YtHsC/RQnW2nnrFy9l2IBKnfzUVJeJGVwgEN4xQLbXdlYlSfGlli0t4YlCjOfwcxqA5Mm/YCd4wYnBFT/mtX4HCBYG3IVZ1vcfcU9KDbYE6Dc5uM4k7Z8MPOBNl6OMZuBqG5AEVo8GTRmEftLjlbsrMPuDQnimdHiG/5Ecag6Wvd2U21DY0VgfhuQf/aExzHZ1n/BhnVxe1k+IdbBC3QANjnH/GZOxpPcVnixlgICROQTrQraUdQcDhDxYQZC7uqKxfsl2f7onEIok+qLZbj5Klcf8m+EpIcKFO7EhTzpa+2dnoi+GRYWgoyGT6d53jDtHw/cw===+AVk"
}