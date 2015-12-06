component "wcwidth" do |pkg, settings, platform|
  pkg.version "0.1.5"
  pkg.md5sum "2282d853074f2f1f465a3387e524d99b"
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
