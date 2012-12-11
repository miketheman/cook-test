#
# Cookbook Name:: cook-test
# Recipe:: default
#
# Copyright 2012, Mike Fiedler
#
# All rights reserved - Do Not Redistribute
#

node['ntp']['packages'].each do |ntppkg|
  package ntppkg do
    action :install
  end
end

service node['ntp']['service'] do
  supports :status => true, :restart => true
  action [:enable, :start]
end

template "/etc/ntp.conf" do
  source "ntp.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => node['ntp']['service'])
end
