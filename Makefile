.PHONY: all clean

TARGET = ./target/release/awatcher

all: $(TARGET)

build:$(TARGET)

$(TARGET):
	cargo build --release

clean:
	cargo clean
	rm -f $(TARGET)

package:
	# Clean and prepare target/package folder
	rm -rf target/package
	mkdir -p target/package
	# move and rename the binary
	cp $(TARGET) target/package/aw-awatcher

	# Copy everything into `dist/aw-server-rust`
	mkdir -p dist
	rm -rf dist/aw-awatcher
	cp -rf target/package dist/aw-awatcher