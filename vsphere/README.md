
The code uses the CDO Terraform Provider to create an SDC in CDO, and then uses the [vSphere cdo-sdc](https://registry.terraform.io/modules/CiscoDevNet/cdo-sdc/vsphere/latest) Terraform module to create an SDC VM inside your vSphere datacenter, and initialize it using the bootstrap data for the created SDC.
> :warning: To run this code, you will need to check out this repository and run terraform from a client that can reach your vSphere environment.

> :warning: The vSphere account used has to have administrative access to create a VM, content libraries and content library items, read datacenters, hosts, networks, compute resource pools, and datastores.


# Step 1: Create an API Only user with Super-Admin Role

Follow the instructions in the CDO documentation to create an API Only User with Super-Admin role. Copy the API token you have generated and keep it safe. You will need it soon.

# Step 2: Clone the repo
```bash
git clone https://github.com/ciscodevnet/terraform-provider-cdo
cd vsphere
```

# Step 3: Copy terraform.tfvars.sample to terraform.tfvars

```bash
cp terraform.tfvars.sample terraform.tfvars
```

Now, edit the values in `terraform.tfvars` and enter in the correct values.


# Step 4: Init and plan

```bash
terraform init
terraform plan -out vsphere.out
```

# Step 5: Apply

```bash
terraform apply
```

# Step 6: Verify in CDO

You can verify this in CDO as follows:
 1. Log into your tenant in CDO using a web browser.
 1. Click on your username on the top right-hand corner of the CDO UI, and click **Secure Connectors**.
 ![Secure Connectors Menu Item](./images/secure-connectors-menu-item.png "Secure Connectors Menu")
 1. You should see an SDC called `sdc-in-vsphere` with the status set to **Active**.
 ![Secure Connectors](./images/secure-connector-vsphere.png "Secure Connectors")