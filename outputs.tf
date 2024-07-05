output "id" {
  description = "vault id"
  value       = oci_kms_vault.main.id
}

output "key_id" {
  description = "key id"
  value       = oci_kms_key.main.id
}

output "management_endpoint" {
  description = "management_endpoint id"
  value       = oci_kms_vault.main.management_endpoint
}