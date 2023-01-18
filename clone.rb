require 'json'

BRANCH = ENV['BRANCH'] || "prod-beta"

JSON.parse(File.read("./frontend_build_repos.json")).values.each do |repo|
  %x[git clone #{repo} --branch #{BRANCH} ./bundles/#{File.basename(repo)}] if !File.exist?(File.basename(repo))
end

%x[git clone https://github.com/RedHatInsights/cloud-services-config --branch #{BRANCH}] if !File.exist?(File.basename(cloud-services-config))
