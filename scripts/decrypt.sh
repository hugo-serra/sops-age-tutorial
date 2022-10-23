#!/bin/bash

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${scriptDir}/.." || exit 1

SOPS_AGE_KEY_FILE=$(pwd)/secrets/age-key.txt sops --decrypt --age $(awk -v d="," -F'=' '{s=(NR==1?s:s d)$2}END{print s}' < secrets/public-age-keys.txt) -i $1
