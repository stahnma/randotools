component "prompt_toolkit" do |pkg, settings, platform|
  pkg.version "0.49"
  pkg.md5sum "80d2a82af5e3ccc594f4e4e3b2d97122"
  pkg.url "http://buildsources.delivery.puppetlabs.net/saws/#{pkg.get_name}-#{pkg.get_version}.tar.gz"

  pkg.build_requires "python"
  pkg.build_requires "setuptools"
  pkg.build_requires "wcwidth"
  if platform.is_deb?
  #  pkg.build_requires "libcurl4-openssl-dev"
  end

  pkg.install do
    [
      "#{settings[:bindir]}/python setup.py install --prefix=#{settings[:prefix]}"
    ]
  end
end
