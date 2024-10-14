#!/usr/bin/env bash
#
# releasetools.bash - Generic release tools and helpers
#
# NOTE: This module should be considered as an internal module
#       and not meant as a generic catch-all module for functions
#       without a namespaace.
#
# Copyright (c) 2024 Mihai Bojin, https://MihaiBojin.com/
#
# Licensed under the Apache License, Version 2.0
#   http://www.apache.org/licenses/LICENSE-2.0
#

# Test to ensure that all required utilities are installed.
function base::internal_check_deps() {
  return 0
}

# Returns the version of the release tools.
function base::version() {
  echo "{{version}}"
}

# Returns the absolute path to where the release tools have been installed.
function base::install_location() {
  local dir
  dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  echo "$dir"
}

# Returns the path to a directory where the binaries should be symlinked.
function base::_symlink_binary_location() {
  local dir

  # Allows customizing where binaries are linked
  if [ -z "${RELEASETOOLS_BINARY_DIR-}" ]; then
    dir="$HOME/.local/bin"
  else
    dir="$(cd "$RELEASETOOLS_BINARY_DIR" && pwd -P)"
  fi

  echo "$dir"
}
