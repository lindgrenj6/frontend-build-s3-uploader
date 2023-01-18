#!/usr/bin/env bash
set -x

# copy up all of the "apps" we need, chrome + landing included
for i in $(ls ./bundles); do
    (
        cd bundles/$i
        # awful build script name, but we need it for the APP_NAME constant
        name=$(awk '/String APP_NAME/ {print $4}' < 58231b16fdee45a03a4ee3cf94a9f2c3 | tr -d '"')
        aws s3 sync --include '*' --exclude '.git/*' ./ s3://consoledot-static/beta/apps/$name
    )
done

# and finally copy up the config
aws s3 sync --include '*' --exclude '.git/*' ./cloud-services-config/ s3://consoledot-static/beta/config
