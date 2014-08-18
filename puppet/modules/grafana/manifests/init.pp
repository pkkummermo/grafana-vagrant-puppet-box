class grafana {

  $build_dir = "/tmp"
  $grafana_version = "1.7.0"

  $grafana_url = "http://grafanarel.s3.amazonaws.com/grafana-$grafana_version.tar.gz"
  $grafana_loc = "$build_dir/grafana-$grafana_version.tar.gz"
  $grafana_dest = "/opt/grafana/"
  $grafana_settings = "/opt/grafana/config.js"

  exec { "download-grafana":
    command => "wget -O $grafana_loc $grafana_url",
    creates => "$grafana_loc"
  }

  exec { "unpack-grafana":
    command => "tar -zxvf $grafana_loc",
    cwd => $build_dir,
    subscribe => Exec[download-grafana],
    refreshonly => true,
  }

  exec { "install-grafana" :
    command => "mv grafana-$grafana_version $grafana_dest",
    cwd => "$build_dir",
    require => Exec[unpack-grafana],
    creates => "/opt/grafana",
  }

  file { $grafana_settings :
    source => "puppet:///modules/grafana/config.js",
    ensure => present,
    require => Exec[install-grafana],
  }
  file { "${grafana_dest}config.sample.js" :
    ensure => absent,
    require => Exec[install-grafana],
  }
}