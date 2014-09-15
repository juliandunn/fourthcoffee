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

windows_feature 'IIS-WebServerRole' do
  action :install
end

# Pre-requisite features for IIS-ASPNET45 that need to be installed first, in this order.
%w{IIS-ISAPIFilter IIS-ISAPIExtensions NetFx3ServerFeatures NetFx4Extended-ASPNET45 IIS-NetFxExtensibility45}.each do |f|
  windows_feature f do
    action :install
  end
end

windows_feature 'IIS-ASPNET45' do
  action :install
end