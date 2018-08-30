# encoding: utf-8
# copyright: 2018, Chef CFT

control 'gdpr-windows-account-password-complexity' do
  impact 1.0
  title 'Checks that Windows password complexity is enabled'
  describe security_policy do
    its('PasswordComplexity') { should eq 1 }
  end
end
