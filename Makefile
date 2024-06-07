PROVIDERS = aws azure civo digitalocean gcp linode ovh scaleway vultr

docs-targets = $(addprefix docs-, $(PROVIDERS))
tfvars-targets = $(addprefix tfvars-, $(PROVIDERS))
fmt-targets = $(addprefix fmt-, $(PROVIDERS))

all: docs fmt tfvars

docs: $(docs-targets)
$(docs-targets): docs-%: %
	cd $< && terraform-docs -c ../.tf-docs-readme.yml .

tfvars: $(tfvars-targets)
$(tfvars-targets): tfvars-%: %
	cd $< && terraform-docs -c ../.tf-docs-tfvars.yml .

fmt: $(fmt-targets)
$(fmt-targets): fmt-%: %
	cd $< && terraform fmt