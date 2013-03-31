#
# Cookbook Name:: tmux
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "tmux" do
    action :install
end
template "/home/vagrant/.tmux.conf" do
    source "tmux.conf.erb"
    owner "vagrant"
    group "vagrant"
    mode 0644
end

