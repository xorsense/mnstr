DOMAIN ?= example.com
PREFIX ?= /app

deploy: release-linux
	rsync -av --progress target/x86_64-unknown-linux-gnu/release/mnstr2023 ${DOMAIN}:${PREFIX}

release:
	cargo build --release

release-linux:
	CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-unknown-linux-gnu-gcc cargo build --release --target x86_64-unknown-linux-gnu