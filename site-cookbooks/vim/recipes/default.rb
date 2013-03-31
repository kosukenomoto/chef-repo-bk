#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "vim" do
    action :install
end
directory "/home/vagrant/.bundle" do
    owner "vagrant"
    group "vagrant"
    mode 0755
end
directory "/home/vagrant/.vim" do
    owner "vagrant"
    group "vagrant"
    mode 0755
end
git "/home/vagrant/.bundle/neobundle.vim" do
    repository "git://github.com/Shougo/neobundle.vim.git"
    reference "master"
    user "vagrant"
    group "vagrant"
    action :sync
end
template "/home/vagrant/.vimrc" do
    source "vimrc.erb"
    owner "vagrant"
    group "vagrant"
    mode 0644
end
