output "id" {
  description = "secret id"
  value       = oci_vault_secret.main.id
}

output "secret_content" {
  description = "secret content"
  value       = oci_vault_secret.main.secret_content
}