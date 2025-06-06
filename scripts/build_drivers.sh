#!/bin/bash

if [ -z "${DRIVERS}" ]; then
  echo "PROVIDE \$DRIVERS!"
  exit 1
fi

if [ -z "${DRIVERS_OUT}" ]; then
  echo "PROVIDE \$DRIVERS_OUT directory to save drivers!"
  exit 1
fi

if [ -z "${DRIVERS_PATH}" ]; then
  echo "PROVIDE \$DRIVERS_PATH directory where drivers workspace"
  exit 1
fi

mkdir -p "${DRIVERS_OUT}" | /bin/true


cd ${DRIVERS_PATH}

for DRIVER in ${DRIVERS}; do
	cargo build \
	-Z build-std=core,alloc,compiler_builtins \
	-Z build-std-features=compiler-builtins-mem \
	--release \
	--bin ${DRIVER} || exit $?


	objcopy -x --strip-unneeded \
	        --keep-section=.modinfo \
	        target/i686-unknown-linux-gnu/release/${DRIVER} ${DRIVERS_OUT}/${DRIVER}
done

touch ${DRIVERS_OUT}
