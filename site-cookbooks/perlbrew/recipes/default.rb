#
# Cookbook Name:: perlbrew
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#for user Databag Users 
data_ids = data_bag('users')
data_ids.each do |id|
    u = data_bag_item('users',id)
    

    bash "install perlbrew" do
        user u['username']
        group u['username']
        cwd u['home']
        environment "HOME" => u['home']
        code <<-EOC
            curl -kL http://install.perlbrew.pl | bash
        EOC
        creates u['home'] + "/perl5/perlbrew/bin/perlbrew"
    end

end
