# encoding: utf-8
# copyright: 2018, Chef CFT

control 'gdpr-data-security-validator' do
  impact 1.0
  title 'Validates security of the SQL configuration'
  describe mysql_conf do
    its('user') { should_not eq 'root' }
    its('bind-address') { should_not eq '0.0.0.0' }
    its('default_password_lifetime') { should eq '30' }
  end
end