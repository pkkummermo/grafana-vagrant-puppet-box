class elasticsearch {

  $build_dir = "/tmp"

  $elasticsearch_url = "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.tar.gz"
  $elasticsearch_loc = "$build_dir/elasticsearch-1.2.1.tar.gz"
  $elasticsearch_dest = "/opt/elasticsearch/"
  $elasticsearch_log = "/var/log/elasticsearch"
  $elasticsearch_init = "/etc/init.d/elasticsearch"

  package { "openjdk-7-jre" :
    ensure => latest,
  }

  file { $elasticsearch_init :
    source => "puppet:///modules/elasticsearch/elasticsearch.sh",
    ensure => present
  }

  file { $elasticsearch_log :
    ensure => directory,
    owner => www-data,
    group => www-data,
  }
  
  exec { "download-elasticsearch":
    command => "wget -O $elasticsearch_loc $elasticsearch_url",
    creates => "$elasticsearch_loc",
    notify => Service[elasticsearch],
  }

  exec { "unpack-elasticsearch":
    command => "tar -zxvf $elasticsearch_loc",
    cwd => $build_dir,
    subscribe => Exec[download-elasticsearch],
    refreshonly => true,
    notify => Service[elasticsearch],
  }

  exec { "install-elasticsearch" :
    command => "mv elasticsearch-1.2.1 $elasticsearch_dest",
    cwd => "$build_dir",
    require => Exec[unpack-elasticsearch],
    creates => "/opt/elasticsearch",
    notify => Service[elasticsearch],
  }

  service { elasticsearch :
    ensure  => running,
    require => File[$elasticsearch_init]
  }
}