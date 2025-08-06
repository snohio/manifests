control 'puppet-installed' do
  impact 1.0
  title 'Check if Puppet is installed'
  desc 'Ensures that the Puppet executable is available on the system'

  describe command('puppet --version') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /^\d+\.\d+\.\d+/ }
  end

  describe file('/opt/puppetlabs/bin/puppet') do
    it { should exist }
    it { should be_executable }
  end
end
