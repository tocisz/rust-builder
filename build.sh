#/bin/sh
BIN_NAME=$1

cd /usr/src/myapp
cargo install --root /installed
mkdir -p /installed/lib
for f in `ldd -v /installed/bin/$BIN_NAME | awk '/Version information/ {vi=1} / => / { if (vi) {print $4} }'|sort|uniq`; do cp $f /installed/lib/; done
