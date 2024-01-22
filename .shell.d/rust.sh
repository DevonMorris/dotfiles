[ -f $HOME/.cargo/env ] && source "$HOME/.cargo/env"

function rstest {
    cargo update --color=always 2>&1 > /dev/null
    cargo test --color=always "$@" 2>&1
}

function rsclip {
    cargo update --color=always 2>&1 > /dev/null
    cargo clippy --all-targets --all-features -- -D warnings -D clippy::missing_docs_in_private_items -D missing_docs 2>&1
}

function rsdoc {
  cargo clippy --all-targets --all-features -- -A clippy::all -D clippy::missing_docs_in_private_items -D missing_docs 2>&1
}
