platform "fedora-f22-x86_64" do |plat|
  plat.servicedir "/usr/lib/systemd/system"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "systemd"

  plat.provision_with "dnf install -y autoconf automake rsync gcc make rpmdevtools rpm-libs"
  plat.yum_repo "http://pl-build-tools.delivery.puppetlabs.net/yum/pl-build-tools-release-fedora-22.noarch.rpm"
  plat.install_build_dependencies_with "dnf install -y"
  plat.vcloud_name "fedora-22-x86_64"
end
