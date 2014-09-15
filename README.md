Fourth Coffee Corporation of Seattle, Inc.
==========================================

This cookbook is used as a demonstration with Microsoft Desired State Configuration.

Fourth Coffee: http://msdn.microsoft.com/en-us/library/hh478190.aspx

Requirements
------------

### Platforms
This has only been test on:

* Windows 2012R2

### Cookbooks

* dsc
* iis
* windows


Recipes
-------

default - Add this to your runlist to deploy the Fourth Coffee site. 
 

Attributes
----------

* `node['fourthcoffee']['install_path']` - sets the install path for the Fourth Coffee Site. Default: `C:\inetpub\FourthCoffee`
* `node['fourthcoffee']['install_method']` - sets the install method to use, `_dsc` for Desired State Configuration based resources or `_classic` for the `windows` cookbook based resources. Default: `_dsc`



License and Authors
-------------------

* Author:: Julian C. Dunn (<jdunn@getchef.com>)
* Author:: Michael Ducy (<michael@getchef.com>)
* Copyright:: Copyright (c) 2014 Chef Software, Inc.
* License:: Apache License, Version 2.0

```text

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
