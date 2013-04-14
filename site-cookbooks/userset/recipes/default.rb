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
    bash "ssh keygen" do
        user u['username']
        group u['username']
        cwd u['home']
        environment "HOME" => u['home']
        code <<-EOC
            ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
        EOC
        creates u['home'] +"/.ssh/id_rsa.pub"
    end
    template u['home'] + "/.ssh/config" do
        source "ssh_config.erb"
        owner u['username']
        group u['username']
        mode 0644
    end
    cookbook_file u['home'] + "/startup.md" do
        source "startup.md"
        owner u['username']
        group u['username']
        mode 0755
    end
end
