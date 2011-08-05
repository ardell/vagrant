package "monit" do
  action :install
end

if platform?("ubuntu")
  cookbook_file "/etc/default/monit" do
    source "monit.default"
    owner "root"
    group "root"
    mode 0644
  end
end

service "monit" do
  action :start
  enabled true
  supports [:start, :restart, :stop]
end

etc_monit = "/etc/monit"
directory etc_monit do
  mode '0700'
  recursive true
end
template "#{etc_monit}/monitrc" do
  owner "root"
  group "root"
  mode 0700
  source 'monitrc.erb'
  notifies :restart, resources(:service => "monit"), :immediate
end
