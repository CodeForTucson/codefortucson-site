CONVERT=$(shell which convert)
JPEGOPTIM=$(shell which jpegoptim)

JPEG_ASSETS=$(shell find source_assets/images -type f -iname "*.jpg")
PNG_ASSETS=$(shell find source_assets/images -type f -iname "*.png")

run: build
	@jekyll serve --config _config.yml,_config_local.yml --baseurl '' --watch --verbose

build: optimized-assets
	@jekyll build --config _config.yml,_config_local.yml

optimized-assets: optimized-images

optimized-images: optimized-jpg optimized-png

optimized-jpg: $(JPEG_ASSETS:source_assets/images/%=assets/images/%)

optimized-png: $(PNG_ASSETS:source_assets/images/%=assets/images/%)

assets/images/%.png: $(PNG_ASSETS)
	@echo "Optimizing $(notdir $@)"
	@mkdir -p $(dir $@)
	@pngcrush -rem allb -brute -reduce "$(@:assets/%=source_assets/%)" "$@" >/dev/null 2>&1

assets/images/%.jpg: $(JPEG_ASSETS)
	@mkdir -p $(dir $@)
	@$(CONVERT) "$(@:assets/%=source_assets/%)" -resize "1600>" -quality 100 "$@"
	@$(JPEGOPTIM) -m85 -s --all-progressive "$@"

clean:
	@rm -rf assets/images/
