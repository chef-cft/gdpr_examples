# encoding: utf-8
# copyright: 2018, Chef CFT

control "gdpr-benchmark-windiws-firewall-ensure-on" do
  title "Ensure Windows Firewall is set to On"
  desc  "For GDPR compliance we need Windows Firewall with Advanced Security use the settings for this profile to filter network traffic."
  impact 1.0
  describe registry_key("HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile") do
    it { should have_property "EnableFirewall" }
  end
  describe registry_key("HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile") do
    its("EnableFirewall") { should cmp == 1 }
  end
end


control "gdpr-benchmark-windiws-firewall-block-inbound-on" do
  title "Ensure we block inbound unless overriden"
  desc  "This setting determines the behavior for inbound connections that do not match an inbound firewall rule. 
    The default behavior is to block connections unless there are firewall rules to allow the connection."
  impact 1.0
  describe registry_key("HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile") do
    it { should have_property "DefaultInboundAction" }
  end
  describe registry_key("HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile") do
    its("DefaultInboundAction") { should cmp == 1 }
  end
end