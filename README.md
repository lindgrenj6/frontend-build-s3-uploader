# How do we get all of the static assets into S3 anyway?

There are 2 scripts to do that in this repo:
1. `clone.rb`, a ruby script that downloads all the repos in the `./frontend_build_repos.json` file. This can be updated with more components if we need them.
2. `upload.sh`, the name is on the tin that it just syncs all the repos in `./bundles` up to the s3 bucket of choice.

Notes:
`clone.rb` takes an ENV var BRANCH which defaults to `prod-beta`, the upload script handles that path properly. we'll need to just remove teh `/beta` in that script to upload for prod-stable

I need to have a script that loops through the repos and checks out a branch and cleans, so its easy to sync x version of a branch up to a bucket
