component "pip" do |pkg, settings, platform|
  pkg.version "7.1.2"
  pkg.md5sum "3823d2343d9f3aaab21cf9c917710196"
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
