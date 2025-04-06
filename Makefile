LAMBDA_DIR=lambda
DIST_DIR=dist
ZIP_NAME=index.zip

.PHONY: build zip plan apply clean test-local

build:
	cd $(LAMBDA_DIR) && node build.mjs

zip: build
	cd $(LAMBDA_DIR) && \
	rm -rf ../$(DIST_DIR) && mkdir -p ../$(DIST_DIR)/package && \
	npm install --omit=dev --prefix ../$(DIST_DIR)/package && \
	node build.mjs && \
	cp ../$(DIST_DIR)/index.js ../$(DIST_DIR)/package/ && \
	cd ../$(DIST_DIR)/package && zip -r ../../$(ZIP_NAME) .

plan:
	cd terraform && terraform plan

apply:
	cd terraform && terraform apply

test-local: build
	node $(LAMBDA_DIR)/test.mjs

clean:
	rm -rf $(DIST_DIR) $(ZIP_NAME) .terraform terraform.tfstate*
