#!/bin/bash

set -eo pipefail

# avoid 'Missing dependencies for SOCKS support' issue
proxy=$(echo ${ALL_PROXY})
unset ALL_PROXY

python -m pip install --user -r requirements.txt

# set proxy again if have
if [[ -z ${proxy} ]]; then
	export ALL_PROXY="${proxy}"
	echo 'ALL_PROXY reset'
fi

