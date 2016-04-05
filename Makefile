OPTIMIZE="./optimizeImage.sh"

IMAGE_ASSETS=$(shell find source_assets/images -type f \( -iname "*.jpg" -o -iname "*.png" \))

run: build
	@jekyll serve --config _config.yml,_config_local.yml --baseurl '' --watch --verbose

build: optimized-images
	@jekyll build --config _config.yml,_config_local.yml

optimized-images: $(IMAGE_ASSETS:source_assets/images/%=assets/images/%)

assets/images/%: $(IMAGE_ASSETS)
	@mkdir -p $(dir $@)
	@$(OPTIMIZE) $@

clean:
	@rm -rf assets/images/
	@rm -rf _site/
