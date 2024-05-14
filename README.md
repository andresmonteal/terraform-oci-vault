# OCI Vault Module

This Terraform module deploys a Vault in Oracle Cloud Infrastructure (OCI). The module provisions a Key Management (KMS) Vault along with an associated encryption key.

## Features

- Creates an OCI Key Management (KMS) Vault.
- Generates an encryption key within the Vault.

## Prerequisites

Before using this module, make sure you have the following:

- OCI account credentials with the necessary permissions to create resources.
- Terraform (v1.0.0 or above) installed and configured correctly.
- Terraform OCI provider (v4.96.0 or above) installed and configured correctly.

## Usage
To use this module, include it in your Terraform configuration and specify the required input variables. Here's a basic example of how to use the module:

```hcl
module "vault" {
  source             = "path_to_module"
  tenancy_ocid       = "your_tenancy_ocid"
  compartment        = "your_compartment_name"
  name               = "vault_name"
  type               = "vault_type"
  key_display_name   = "key_display_name"
  key_shape_algorithm= "key_shape_algorithm"
  key_shape_length   = "key_shape_length"
  key_protection_mode= "key_protection_mode"
  defined_tags       = {}
  freeform_tags      = {}
}
```

Replace "path_to_module" with the path to the module directory or the Git repository URL. 
Replace the values with your specific requirements.

## Variables
Before using this module, you must configure the required variables. These can be set in a terraform.tfvars file for easy module configuration.

| Name                | Description                                                  | Type        | Default      | Required |
|---------------------|--------------------------------------------------------------|-------------|--------------|----------|
| tenancy_ocid        | The OCID of the root compartment.                            | string      | null         | yes      |
| compartment         | The name of the compartment where to create all resources.   | string      | null         | yes      |
| name                | The display name of the Vault.                               | string      | -            | yes      |
| compartment_id      | The OCID of the compartment where the Vault will be created. | string      | null         | no       |
| type                | The type of Vault.                                           | string      | "DEFAULT"    | no       |
| key_display_name    | The display name of the encryption key.                      | string      | "master-key" | no       |
| key_shape_algorithm | The algorithm used to generate the encryption key.           | string      | "AES"        | no       |
| key_shape_length    | The length of the encryption key.                             | string      | "32"         | no       |
| key_protection_mode | The protection mode of the encryption key.                   | string      | "HSM"        | no       |
| freeform_tags       | Free-form tags for this resource.                             | map(string) | null         | no       |
| defined_tags        | Defined tags for this resource.                               | map(string) | null         | no       |

**Note:** If `compartment_id` is provided, it will override the `compartment` variable.

## Outputs

| Name                | Description            |
|---------------------|------------------------|
| id                  | Vault id               |
| management_endpoint| Management endpoint id |

## Notes
- Ensure that you have the necessary IAM permissions to create resources in the specified compartments and VCN.
- Review and customize the module inputs according to your specific requirements.
- For more information on DNS Views in OCI and its configuration options, refer to the [OCI documentation](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/home.htm).
