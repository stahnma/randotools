component "awscli" do |pkg, settings, platform|
  pkg.version "1.9.11"
  pkg.md5sum "0ee4ee7665665bce7adfe384832e7e35"
  pkg.url "http://buildsources.delivery.puppetlabs.net/saws/#{pkg.get_name}-#{pkg.get_version}.tar.gz"

  pkg.build_requires "python"
  pkg.build_requires "rsa"
  pkg.build_requires "docutils"
  pkg.build_requires "colorama"
  pkg.build_requires "botocore"
  if platform.is_deb?
  #  pkg.build_requires "libcurl4-openssl-dev"
  end

  pkg.install do
    [
      #"sed -i 's/prompt-toolkit/prompt_toolkit/g' setup.cfg",
     "#{settings[:bindir]}/python setup.py install --prefix=#{settings[:prefix]}"
    ]
  end

  pkg.link "#{settings[:bindir]}/aws", "/usr/local/bin/aws" unless platform.is_deb?

end
