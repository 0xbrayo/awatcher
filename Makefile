.PHONY: build

# Build in release mode by default, unless RELEASE=false
ifeq ($(RELEASE), false)
		cargoflag :=
		targetdir := debug
else
		cargoflag := --release
		targetdir := release
endif

build:
	cargo build $(cargoflag)

clean:
	cargo clean
	rm -f $(TARGET)

package:
	# Clean and prepare target/package folder
	rm -rf target/package
	mkdir -p target/package
	# Copy binaries
	cp target/$(targetdir)/awatcher target/package/awatcher
	# Copy service file
	cp -f config/awatcher.service target/package/awatcher.service
	# Copy everything into `dist/awatcher`
	mkdir -p dist
	rm -rf dist/awatcher
	cp -rf target/package dist/awatcher
