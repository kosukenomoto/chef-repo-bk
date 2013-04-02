#
# Cookbook Name:: zsh
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "zsh" do
    action :install
end

#for user Databag Users 
data_ids = data_bag('users')
data_ids.each do |id|
    u = data_bag_item('users',id)
    
    directory u['home'] + "/.zsh" do
        owner u['username']
        group u['username']
        mode 0755
    end
    git u['home'] + "/.zsh/autojump" do
        repository "git://github.com/joelthelion/autojump.git"
        reference "master"
        user u['username']
        group u['username']
        action :sync
    end
    bash "autojump compile" do
        user u['username']
        group u['username']
        cwd u['home'] + "/.zsh/autojump"
        environment "HOME" => u['home']
        code <<-EOC
            ./install.sh
        EOC
        creates u['home'] +"/.autojump/_j"
    end
    git u['home'] + "/.zsh/git-prompt" do
        repository "git://github.com/olivierverdier/zsh-git-prompt.git"
        reference "master"
        user u['username']
        group u['username']
        action :sync
    end
    template u['home'] + "/.zprofile" do
        source "zprofile.erb"
        owner u['username']
        group u['username']
        mode 0644
    end
    template u['home'] + "/.zshenv" do
        source "zshenv.erb"
        owner u['username']
        group u['username']
        mode 0644
    end
    template u['home'] + "/.zshrc" do
        source "zshrc.erb"
        owner u['username']
        group u['username']
        mode 0644
    end
end

