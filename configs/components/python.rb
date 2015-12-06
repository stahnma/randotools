component "python" do |pkg, settings, platform|
  pkg.version "2.7.10"
  pkg.md5sum "d7547558fd673bd9d38e2108c6b42521"
  pkg.url "http://buildsources.delivery.puppetlabs.net/Python-#{pkg.get_version}.tgz"

    pkg.environment "CFLAGS" => "$${CFLAGS} -fPIC"
    pkg.environment "LDFLAGS" => "-Wl,-rpath=#{settings[:libdir]} -L#{settings[:libdir]}"
    pkg.build_requires "make"
    if platform.is_deb?
      pkg.build_requires "build-essential"
      pkg.build_requires "libbz2-dev"
      pkg.build_requires "zlib1g-dev"
      pkg.build_requires "libssl-dev"
    end

  pkg.configure do
    [ "./configure --prefix=#{settings[:prefix]} --enable-shared --enable-unicode  --enable-ipv6" ]
  end

  pkg.build do
    [ "#{platform[:make]} VERBOSE=1 -j$(shell expr $(shell #{platform[:num_cores]}) + 1)" ]
  end

  pkg.install do
    [ "#{platform[:make]} VERBOSE=1 -j$(shell expr $(shell #{platform[:num_cores]}) + 1) install" ]
  end

end
