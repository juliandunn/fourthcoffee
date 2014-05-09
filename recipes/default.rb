#
# Cookbook Name:: fourthcoffee
# Recipe:: default
#
# Copyright 2014, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install DSC Resource Kit, Wave 3
# This gets us xWebsite, xWebAdministration, and so on
include_recipe 'dsc::getdscresourcekit'

include_dsc 'WindowsFeature'
include_dsc 'xWebsite'

dsc_windowsfeature 'iis' do
  dsc_name 'Web-Server'
  dsc_ensure 'Present'
end

dsc_windowsfeature 'dotnet45' do
  dsc_name 'Web-Asp-Net45'
  dsc_ensure 'Present'
end

dsc_xwebsite 'DefaultSite' do
  dsc_name 'Default Web Site'
  dsc_ensure 'Present'
  dsc_state 'Stopped'
  physicalpath 'c:\inetpub\wwwroot'
end

remote_directory node['fourthcoffee']['install_path'] do
  source 'fourthcoffee'
  # might need rights here
  action :create
end

dsc_xwebsite 'BakeryWebSite' do
  dsc_name 'FourthCoffee'
  dsc_ensure 'Present'
  dsc_state 'Started'
  physicalpath node['fourthcoffee']['install_path']
end
