#
# Cookbook Name:: app
# Recipe:: web
# Web server
#

include_recipe 'apache2'
include_recipe 'php'
include_recipe 'apache2::mod_php5'

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
