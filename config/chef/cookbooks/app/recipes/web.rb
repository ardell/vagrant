#
# Cookbook Name:: app
# Recipe:: web
# Web server
#

include_recipe 'apache2'

# Set up apache default site
apache_site "default" do
  action :enable
end
