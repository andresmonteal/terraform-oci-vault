# Oracle Cloud Vault and Secret Terraform Module

This repository contains Terraform modules for creating and managing Oracle Cloud Infrastructure (OCI) Vaults and Secrets.

## Modules

1. **Vault Module**: Creates a vault and associated keys in OCI.
2. **Secret Module**: Creates secrets in a specified vault.

## Usage

### Vault Module

```hcl
module "vault" {
  source              = "./vault"
  tenancy_ocid        = var.tenancy_ocid
  compartment_id      = var.compartment_id
  compartment         = var.compartment
  name                = "myVault"
  type                = "DEFAULT"
  key_display_name    = "master-key"
  key_shape_algorithm = "AES"
  key_shape_length    = 32
  key_protection_mode = "HSM"
  freeform_tags       = {}
  defined_tags        = {}
}
```

### Secret Module

```hcl
module "vault_secret" {
  source              = "./vault/secret"
  tenancy_ocid        = var.tenancy_ocid
  compartment_id      = var.compartment_id
  compartment         = var.compartment
  vault_id            = module.vault.id
  name                = "mySecret"
  content_type        = "BASE64"
  content             = base64encode("mySecretContent")
  freeform_tags       = {}
  defined_tags        = {}
  management_endpoint = module.vault.management_endpoint
  type                = "ssh" # or null for non-ssh
}
```

## Inputs

### Vault Module

| Name                | Description                                                                                     | Type        | Default   | Required |
| ------------------- | ----------------------------------------------------------------------------------------------- | ----------- | --------- | -------- |
| `tenancy_ocid`      | (Required) The OCID of the root compartment.                                                    | `string`    | `null`    | Yes      |
| `compartment_id`    | (Required) The OCID of the compartment to contain the vault.                                    | `string`    | `null`    | Yes      |
| `compartment`       | (Optional) The name of the compartment to contain the vault.                                    | `string`    | `null`    | No       |
| `name`              | (Required) A user-friendly name for the vault.                                                  | `string`    |           | Yes      |
| `type`              | (Required) The type of vault to create.                                                         | `string`    | `DEFAULT` | Yes      |
| `key_display_name`  | (Optional) A user-friendly name for the key.                                                    | `string`    | `master-key` | No     |
| `key_shape_algorithm` | (Optional) The algorithm used by a key's key versions to encrypt or decrypt.                  | `string`    | `AES`     | No       |
| `key_shape_length`  | (Optional) The length of the key in bytes.                                                      | `string`    | `32`      | No       |
| `key_protection_mode` | (Optional) The service endpoint to perform management operations against.                     | `string`    | `HSM`     | No       |
| `freeform_tags`     | (Optional) Free-form tags for this resource.                                                    | `map(any)`  | `null`    | No       |
| `defined_tags`      | (Optional) Defined tags for this resource.                                                      | `map(any)`  | `null`    | No       |

### Secret Module

| Name                | Description                                                                                     | Type        | Default   | Required |
| ------------------- | ----------------------------------------------------------------------------------------------- | ----------- | --------- | -------- |
| `tenancy_ocid`      | (Required) The OCID of the root compartment.                                                    | `string`    | `null`    | Yes      |
| `compartment_id`    | (Required) The OCID of the compartment to contain the secret.                                   | `string`    | `null`    | Yes      |
| `compartment`       | (Optional) The name of the compartment to contain the secret.                                   | `string`    | `null`    | No       |
| `vault_id`          | (Required) The OCID of the vault where you want to create the secret.                           | `string`    | `null`    | Yes      |
| `vault`             | (Optional) The name of the vault where you want to create the secret.                           | `string`    | `null`    | No       |
| `key_id`            | (Required) The OCID of the master encryption key that is used to encrypt the secret.            | `string`    | `null`    | Yes      |
| `name`              | (Required) A user-friendly name for the secret.                                                 | `string`    |           | Yes      |
| `description`       | (Optional) A brief description of the secret.                                                   | `string`    | `null`    | No       |
| `content_type`      | (Optional) The content type of the secret.                                                      | `string`    | `BASE64`  | No       |
| `content`           | (Optional) The base64-encoded content of the secret.                                            | `string`    | `null`    | No       |
| `content_name`      | (Optional) Names should be unique within a secret.                                              | `string`    | `1`       | No       |
| `freeform_tags`     | (Optional) Free-form tags for this resource.                                                    | `map(any)`  | `null`    | No       |
| `defined_tags`      | (Optional) Defined tags for this resource.                                                      | `map(any)`  | `null`    | No       |
| `management_endpoint` | (Optional) The service endpoint to perform management operations against.                     | `string`    | `null`    | No       |
| `type`              | (Optional) If ssh key then generates key pair and secrets.                                      | `string`    | `null`    | No       |

## Outputs

### Vault Module

| Name                   | Description                      |
| ---------------------- | -------------------------------- |
| `id`                   | The ID of the created vault.     |
| `management_endpoint`  | The management endpoint of the created vault. |

### Secret Module

| Name                   | Description                      |
| ---------------------- | -------------------------------- |
| `id`                   | The ID of the created secret.    |
| `secret_content`       | The content of the created secret. |

## Data Sources

### Vault Module

- `oci_identity_compartments.compartment`: Fetches compartment information.
- `oci_core_vcns.vcns`: Fetches VCN information.
- `oci_core_dhcp_options.dhcp_options`: Fetches DHCP options.

### Secret Module

- `oci_identity_compartments.compartment`: Fetches compartment information.
- `oci_kms_vaults.vault`: Fetches vault information.
- `oci_kms_keys.key`: Fetches key information.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

**Andres F. Montealegre**

- Email: [montealegre.af@gmail.com](mailto:montealegre.af@gmail.com)
- GitHub: [https://github.com/andresmonteal](https://github.com/andresmonteal)
