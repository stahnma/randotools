component "saws" do |pkg, settings, platform|
  pkg.version "0.2.1"
  pkg.md5sum "0de9824baa45df4849cc29792ac9b24a"
  pkg.url "http://buildsources.delivery.puppetlabs.net/saws/#{pkg.get_name}-#{pkg.get_version}.tar.gz"

  pkg.build_requires "python"
  pkg.build_requires "pygments"
  pkg.build_requires "prompt_toolkit"
  pkg.build_requires "ordereddict"
  pkg.build_requires "fuzzyfinder"
  pkg.build_requires "enum34"
  pkg.build_requires "configobj"
  pkg.build_requires "click"
  pkg.build_requires "awscli"
  if platform.is_deb?
  #  pkg.build_requires "libcurl4-openssl-dev"
  end

  pkg.install do
    [
      #"sed -i 's/prompt-toolkit/prompt_toolkit/g' setup.cfg",
     "#{settings[:bindir]}/python setup.py install --prefix=#{settings[:prefix]}"
    ]
  end


  # Can't put a link in /usr/local on debian without dh_usrlocal stepping in and smacking you
  pkg.link "#{settings[:bindir]}/saws", "/usr/local/bin/saws" unless platform.is_deb?

end
