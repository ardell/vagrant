#
# Cookbook Name:: app
# Recipe:: web
# Web server
#

include_recipe 'apache2'
include_recipe 'php'
include_recipe 'apache2::mod_php5'
include_recipe 'php::pear'

# Set up user and group
home_directory = "/home/#{node['web'][:user]}"
directory home_directory do
  mode '0755'
  recursive true
end
user node['web'][:user] do
  home home_directory
  shell "/bin/bash"
end
group node['web'][:group] do
  members [node['web'][:user]]
end
directory home_directory do
  owner node['web'][:user]
  group node['web'][:group]
end

# Set up apache default site
apache_site "default" do
  action :enable
end

# Upgrade pear
# NOTE: The only way to get pear to update reliably after the first
# chef run is to use -f (force), which overwrites newer installed
# packages. Is this ok?
execute "Upgrade pear" do
  command "pear channel-update pear.php.net && pear upgrade -f PEAR"
end
