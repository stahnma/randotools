component "pyasn1" do |pkg, settings, platform|
  pkg.version "0.1.9"
  pkg.md5sum "f00a02a631d4016818659d1cc38d229a"
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
