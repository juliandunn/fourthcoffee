require 'spec_helper'

describe windows_feature('IIS-WebServer') do
  it { should be_installed }
end

describe port(80) do
  it { should be_listening }
end

describe file('C:\inetpub\FourthCoffee\Default.cshtml') do
  it { should be_file }
end
