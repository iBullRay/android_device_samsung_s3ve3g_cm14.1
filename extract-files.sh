#!/bin/sh

set -e

export DEVICE_COMMON=msm8226-common
export DEVICE=s3ve3gxx
export VENDOR=samsung
./../$DEVICE_COMMON/extract-files.sh $@