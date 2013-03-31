#
# Cookbook Name:: userset
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user "knomoto" do
    comment "kosukenomoto user"
    shell "/bin/zsh"
    password nil
    supports :manage_home => true
end
