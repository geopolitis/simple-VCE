#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.



package 'Install Nginx' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'nginx'
  when 'ubuntu', 'debian'
    package_name 'nginx'
  end
end


template '/etc/nginx/nginx.conf' do
	source 'nginx-conf.erb'
	mode '0644'
end

service 'nginx' do
  action :restart
end
