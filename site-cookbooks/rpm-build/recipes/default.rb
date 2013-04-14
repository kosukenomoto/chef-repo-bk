#
# Cookbook Name:: rpm-build
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
[
    "rpm-build",
    "redhat-rpm-config",
    "hmaccalc",
    "xmlto",
    "asciidoc",
    "elfutils-devel",
    "zlib-devel",
    "binutils-devel",
    "newt-devel",
    "python-devel",
    "perl(ExtUtils::Embed)",
    "bison",
    "audit-libs-devel",
    "pciutils-devel"
].each do |pkgname|
    package pkgname do
        action :install
    end
end
