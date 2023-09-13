#!/bin/zsh
set -euo pipefail

### Configure HERE
ht_org="clearcode"
ht_app="onlineboutique"
ht_env="staging"
### /end

dns=$(humctl get active-resources -c /orgs/${ht_org}/apps/${ht_app}/envs/${ht_env} | yq '.[] | select(.object.type == "dns") | .object.resource.host')
open https://$dns
