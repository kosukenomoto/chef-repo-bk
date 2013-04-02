#
# Cookbook Name:: userset
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag('users')
data_ids.each do |id|
    u = data_bag_item('users',id)

    user u['username'] do
        comment u['username'] +" user"
        shell u['shell']
        password u['username']
        supports :manage_home => true
    end
    directory u['home'] + "/.ssh" do
        owner u['username']
        group u['username']
        mode 0755
    end
    cookbook_file u['home'] + "/.ssh/authorized_keys" do
        source "macbook_kn.pub"
        owner u['username']
        group u['username']
        mode 0600
    end
    cookbook_file u['home'] + "/startup.md" do
        source "startup.md"
        owner u['username']
        group u['username']
        mode 0755
    end
end
