output "iam_user_name" {
  description = "iam username"
  value = module.iam_user.iam_user_name

}

output "iam_user_iam_access_key" {
  description = "iam access key"
  value = module.iam_user.iam_access_key_encrypted_secret

}


output "iam_user_iam_access_key_id" {
  description = "iam access key id"
  value = module.iam_user.iam_access_key_id

}
output "iam_user_iam_access_key_fingerprint" {
  description = "iam access key finger print"
  value = module.iam_user.iam_access_key_key_fingerprint

}

output "iam_user_iam_access_key_secret" {
  description = "iam access key secret"
  value = module.iam_user.iam_access_key_secret
  sensitive = true

}

output "iam_user_iam_keybase_pass" {
  description = "iam keybase pass"
  value = module.iam_user.keybase_password_decrypt_command

}



