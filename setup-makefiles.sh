#!/bin/bash
#
# Copyright (C) 2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

INITIAL_COPYRIGHT_YEAR=2018

# Required!
DEVICE=sirius
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

HELPER="$LINEAGE_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper for sirius
setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" true

# Copyright headers and guards
write_headers "$DEVICE"

# The standard sirius blobs
write_makefiles "$MY_DIR"/proprietary-files.txt true

# We are done!
write_footers
