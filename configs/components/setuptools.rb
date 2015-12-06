component "setuptools" do |pkg, settings, platform|
  pkg.version "18.7.1"
  pkg.md5sum "a0984da9cd8d7b582e1fd7de67dfdbcc"
  pkg.url "http://buildsources.delivery.puppetlabs.net/saws/#{pkg.get_name}-#{pkg.get_version}.tar.gz"

  pkg.add_source "file://files/internet.sh", sum: "508bd81ac8280dfdfa2c6e3b912d97ca"

  pkg.build_requires "python"
  if platform.is_el?
    pkg.build_requires "net-tools"
  end

  pkg.install do
    [
      # I like to turn off internet access when building python stuff to ensure
      # deps are being met properly. However, this script only works on the
      # Puppet Labs infrastructure, unless your IP space matches this one.
      # Therefore, I comment this out on the official repo.
      #"../internet.sh off",
      "#{settings[:bindir]}/python setup.py install --prefix=#{settings[:prefix]}"
    ]
  end

end
