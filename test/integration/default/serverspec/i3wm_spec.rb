require 'serverspec'

set :backend, :exec

if os[:family] == 'redhat'
  i3 = 'i3'
else
  i3 = 'i3-wm'
end

describe package(i3) do
  it { should be_installed }
end

describe package('i3lock') do
  it { should be_installed }
end
