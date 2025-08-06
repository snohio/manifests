control 'puppet-installed' do
  impact 1.0
  title 'Check if Puppet is installed'
  desc 'Ensures that the Puppet executable is available on the system'

  describe package('puppet') do
    it { should be_installed }
  end

  describe file('/usr/bin/puppet') do
    it { should exist }
    it { should be_executable }
  end
end
