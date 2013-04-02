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
#for user Databag Users 
data_ids = data_bag('users')
data_ids.each do |id|
    u = data_bag_item('users',id)

    template u['home'] + "/.tmux.conf" do
        source "tmux.conf.erb"
        owner u['username']
        group u['username']
        mode 0644
    end
end
