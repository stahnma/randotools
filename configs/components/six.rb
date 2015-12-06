component "six" do |pkg, settings, platform|
  pkg.version "1.10.0"
  pkg.md5sum "34eed507548117b2ab523ab14b2f8b55"
  pkg.url "http://buildsources.delivery.puppetlabs.net/saws/#{pkg.get_name}-#{pkg.get_version}.tar.gz"

  pkg.build_requires "python"
  pkg.build_requires "setuptools"
  if platform.is_deb?
  #  pkg.build_requires "libcurl4-openssl-dev"
  end

  pkg.install do
    [
      "#{settings[:bindir]}/python setup.py install --prefix=#{settings[:prefix]}"
    ]
  end
end
