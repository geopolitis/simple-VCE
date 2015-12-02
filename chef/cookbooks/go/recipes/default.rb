#
# Cookbook Name:: go
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


package 'Install gccgo' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'gccgo-go'
  when 'ubuntu', 'debian'
    package_name 'gccgo-go'
  end
end

directory '/home/vagrant/go' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

directory '/home/vagrant/go/src' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

template '/home/vagrant/go/src/go-server.go' do
	action :create_if_missing
	source 'http-server.erb'
	mode '0755'
end

file 'home/vagrant/go/src/build' do
  content 'go build go-server.go'
  mode '0755'
  owner 'vagrant'
  group 'vagrant'
end

file 'home/vagrant/go/start-http' do
  content '/home/vagrant/go/src/go-server &'
  mode '0755'
  owner 'vagrant'
  group 'vagrant'
end

execute 'Compile http server' do
	command 'cd /home/vagrant/go/src/ && ./build'
end

execute 'Go http server' do
	command '/home/vagrant/go/start-http &'
end
