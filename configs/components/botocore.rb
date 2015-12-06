component "botocore" do |pkg, settings, platform|
  pkg.version "1.3.11"
  pkg.md5sum "b2344a5a9e4795b66d5d97b96dcb899d"
  pkg.url "http://buildsources.delivery.puppetlabs.net/saws/#{pkg.get_name}-#{pkg.get_version}.tar.gz"

  pkg.build_requires "python"
  pkg.build_requires "setuptools"
  pkg.build_requires "dateutil"
  pkg.build_requires "jmespath"
  if platform.is_deb?
  #  pkg.build_requires "libcurl4-openssl-dev"
  end

  pkg.install do
    [
      "#{settings[:bindir]}/python setup.py install --prefix=#{settings[:prefix]}"
    ]
  end
end
