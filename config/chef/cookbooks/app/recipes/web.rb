#
# Cookbook Name:: app
# Recipe:: web
# Web server
#

include_recipe 'apache2'
include_recipe 'php'
include_recipe 'apache2::mod_php5'

# Set up apache default site
apache_site "default" do
  action :enable
end
