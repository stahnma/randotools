project "saws" do |proj|
  # Project level settings our components will care about
  instance_eval File.read('configs/projects/randotools.rb')

  proj.description "Rando SAWS"
  proj.version "2015.1205"
  proj.release "1"
  proj.license "Apache 2"
  proj.vendor "Stahnke <stahnma@websages.com>"
  proj.homepage "https://github.com/donnemartin/saws"

  proj.requires 'gcc'

  # Platform specific
  proj.setting(:cflags, "-I#{proj.includedir},  -fPIC")
  proj.setting(:ldflags, "-L#{proj.libdir} -Wl,-rpath=#{proj.libdir}")

  proj.component "python"
  proj.component "setuptools"
  proj.component "dateutil"
  proj.component "pip"
  proj.component "saws"
  proj.component "botocore"
  proj.component "click"
  proj.component "rsa"
  proj.component "colorama"
  proj.component "configobj"
  proj.component "jmespath"
  proj.component "pyasn1"
  proj.component "wcwidth"
  proj.component "six"
  proj.component "enum34"
  proj.component "pygments"
  proj.component "prompt_toolkit"
  proj.component "ordereddict"
  proj.component "fuzzyfinder"
  proj.component "awscli"
  proj.component "docutils"

  proj.target_repo ""

end
