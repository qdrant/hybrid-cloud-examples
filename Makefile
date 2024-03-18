PROVIDERS = civo digitalocean linode scaleway vultr

docs-targets = $(addprefix docs-, $(PROVIDERS))
tfvars-targets = $(addprefix tfvars-, $(PROVIDERS))
fmt-targets = $(addprefix fmt-, $(PROVIDERS))

docs: $(docs-targets)
$(docs-targets): docs-%: %
	cd $< && cd terraform && terraform-docs -c ../../.tf-docs-readme.yml .

tfvars: $(tfvars-targets)
$(tfvars-targets): tfvars-%: %
	cd $< && cd terraform && terraform-docs -c ../../.tf-docs-tfvars.yml .

fmt: $(fmt-targets)
$(fmt-targets): fmt-%: %
	cd $< && terraform fmt