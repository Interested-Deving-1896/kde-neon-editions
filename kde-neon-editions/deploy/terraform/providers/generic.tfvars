# Generic / BYO provider — ISO builder
#
# Use this when your cloud provider is not Hetzner, DigitalOcean, or AWS.
#
# This mode does not provision a VM. Instead it renders the cloud-init
# user-data to stdout so you can paste it into any provider's console,
# API, or Terraform resource block.
#
# Steps:
#   1. Get a runner token:
#      https://gitlab.com/groups/openos-project/kde-ecosystem-deving/neon-deving/-/runners/new
#
#   2. Fill in gitlab_runner_token below.
#
#   3. Render the cloud-init user-data:
#        cp providers/generic.tfvars terraform.tfvars
#        terraform init
#        terraform apply
#      This writes cloud-init/rendered-user-data.yaml — paste its contents
#      into your provider's "user data" / "startup script" field.
#
#   4. Provision a VM manually (or via your own Terraform resource) with:
#        - OS:   Ubuntu 22.04+ or Debian 12+  (Ubuntu 24.04 recommended)
#        - CPU:  4 vCPU minimum
#        - RAM:  8 GB minimum
#        - Disk: 40 GB minimum free space
#        - The rendered user-data injected at boot
#
#   5. The runner registers itself automatically on first boot.
#      Verify at:
#      https://gitlab.com/groups/openos-project/kde-ecosystem-deving/neon-deving/-/runners
#
# Supported providers (non-exhaustive):
#   Vultr, OVHcloud, Linode/Akamai, Scaleway, Exoscale, UpCloud,
#   Azure, GCP, Oracle Cloud, Proxmox, bare metal, any KVM/libvirt host.

provider_name = "generic"

# Required — fill in
gitlab_runner_token = ""   # GitLab group runner token (glrt-...)

# VM sizing — used only to document intent; no VM is provisioned here.
# Ensure your actual VM meets or exceeds these values.
vm_cpu     = 4
vm_ram_gb  = 8
vm_disk_gb = 40

# Optional: runner settings
runner_name       = ""   # leave blank to use hostname at registration time
runner_concurrent = 1    # increase if disk >= 80 GB and CPU >= 8
runner_tags       = "privileged,iso-builder,neon"
gitlab_url        = "https://gitlab.com"
