pathappend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${PATH}:" in
      *:${ARG}:*) continue ;;
    esac
    PATH="${PATH:+"${PATH}:"}${ARG}"
  done
}

pathprepend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${PATH}:" in
      *:${ARG}:*) continue ;;
    esac
    PATH="${ARG}${PATH:+":${PATH}"}"
  done
}

pathprepend \
  "${HOME}/scripts" \
  "${HOME}/.local/bin" \
  "${HOME}/.local/go/bin" \
  "${HOME}/.cargo/bin" \
  "${HOME}/.node/bin" \
  "${HOME}/.deno/bin" \
  "${HOME}/bin" \
  "${HOME}/.atuin/bin"

pathappend \
  "/usr/local/opt/coreutils/libexec/gnubin" \
  "/mingw64/bin" \
  "/usr/local/go/bin" \
  "/usr/local/tinygo/bin" \
  "/usr/local/bin" \
  "/usr/local/sbin" \
  "/usr/games" \
  "/usr/sbin" \
  "/usr/bin" \
  "/snap/bin" \
  "/sbin" \
  "/bin"

export PATH

# be sure not to remove ./ or stuff gets weird
export CDPATH=\
./:\
/media/$USER:\
$HOME
