require 'serverspec'

set :backend, :exec

describe file('/etc/apt/sources.list.d/i3.list') do
  it { should be_file }
  its(:content) { should match 'deb http://debian.sur5r.net/i3' }
end

describe package('i3-wm') do
  it { should be_installed }
end

describe package('xorg') do
  it { should be_installed }
end

describe package('i3lock') do
  it { should be_installed }
end
