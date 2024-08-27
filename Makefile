.PHONY: all test coverage lint lint-ci fmt fmt-ci fix build run check audit

# cargo install binstall
# cargo install cargo-tarpaulin
# cargo binstall cargo-tarpaulin
# rustup component add clippy
# rustup component add rustfmt
# cargo install cargo-audit

all: test coverage lint fmt 

test:
	cargo test

coverage:
	cargo tarpaulin --ignore-tests

lint:
	# Strict rust linter
	cargo clippy -- -W clippy::pedantic

lint-ci:
	# Fail when clippy emits any warnings
	cargo clippy -- -D warnings

fmt:
	cargo fmt

fmt-ci:
	# Fail when the code has unformatted code
	cargo fmt -- --check

fix:
	cargo fix --allow-dirty

build:
	cargo build --release

run:
	cargo run

check:
	cargo check

audit:
	cargo audit

