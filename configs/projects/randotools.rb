# Contains all common project settings in one place

platform = proj.get_platform

# Project level settings our components will care about
proj.setting(:prefix, "/opt/randotools")
proj.setting(:sysconfdir, "/etc/randotools")
proj.setting(:logdir, "/var/log/randotools")
proj.setting(:piddir, "/var/run/randotools")
proj.setting(:bindir, File.join(proj.prefix, "bin"))
proj.setting(:libdir, File.join(proj.prefix, "lib"))
proj.setting(:includedir, File.join(proj.prefix, "include"))
proj.setting(:datadir, File.join(proj.prefix, "share"))
proj.setting(:mandir, File.join(proj.datadir, "man"))


proj.directory proj.prefix
proj.directory "/usr/local/bin"
