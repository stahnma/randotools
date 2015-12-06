component "Pygments" do |pkg, settings, platform|
  pkg.version "2.0.2"
  pkg.md5sum "238587a1370d62405edabd0794b3ec4a"
  pkg.url "http://buildsources.delivery.puppetlabs.net/saws/Pygments-#{pkg.get_version}.tar.gz"

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
