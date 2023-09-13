#!/bin/zsh
set -euo pipefail

### Configure HERE
ht_org="clearcode"
ht_app="onlineboutique"
ht_env="staging"
### /end

delta_id=$(humctl api POST /orgs/${ht_org}/apps/${ht_app}/deltas -d "{\"metadata\": {\"name\":\"scripted deploy\", \"env_id\":\"${ht_env}\"}}" | yq .id)

echo "Created delta with ID: ${delta_id}" 

for dir in **/*(/); do
  echo "Deploying $dir..."
  delta=$(score-humanitec delta --app ${ht_app} --env ${ht_env} --org ${ht_org} --token ${HUMANITEC_TOKEN} --delta ${delta_id} --retry -f $dir/score.yaml --extensions $dir/humanitec.score.yaml)
done

humctl deploy delta ${delta_id} ${ht_env} -c /orgs/${ht_org}/apps/${ht_app}/envs/${ht_env} -m "Scripted deployment"
