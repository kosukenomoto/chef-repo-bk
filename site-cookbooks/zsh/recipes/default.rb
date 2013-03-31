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
directory "/home/vagrant/.zsh" do
    owner "vagrant"
    group "vagrant"
    mode 0755
end
git "/home/vagrant/.zsh/autojump" do
    repository "git://github.com/joelthelion/autojump.git"
    reference "master"
    user "vagrant"
    group "vagrant"
    action :sync
end
bash "autojump compile" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant/.zsh/autojump'
    environment "HOME" => '/home/vagrant'
    code <<-EOC
        ./install.sh
    EOC
    creates "/etc/profile.d/autojump.zsh"
end
git "/home/vagrant/.zsh/git-prompt" do
    repository "git://github.com/olivierverdier/zsh-git-prompt.git"
    reference "master"
    user "vagrant"
    group "vagrant"
    action :sync
end
template "/home/vagrant/.zprofile" do
    source "zprofile.erb"
    owner "vagrant"
    group "vagrant"
    mode 0644
end
template "/home/vagrant/.zshenv" do
    source "zshenv.erb"
    owner "vagrant"
    group "vagrant"
    mode 0644
end
template "/home/vagrant/.zshrc" do
    source "zshrc.erb"
    owner "vagrant"
    group "vagrant"
    mode 0644
end

