# Graphite, Carbon, statsd, ElasticSearch and Grafana - All-in-one

Provision a virtual machine with vagrant and puppet with 

* Graphite (http://graphite.wikidot.com/)
* Carbon (http://graphite.wikidot.com/carbon)
* statsd (https://github.com/etsy/statsd/
* ElasticSearch (http://www.elasticsearch.org/) 
* Grafana (http://grafana.org/) 

all ready to boot and receive those precious logging memories from whatever you find interesting to log.

## Details:

Debian package for statsd (github.com/etsy) included

## Port overview 
* Graphite: http://localhost:9100/
* Carbon: http://localhost:2003
* statsd: http://localhost:9125:udp
* ElasticSearch: http://localhost:9200
* Grafana: http://localhost:9100/grafana
 

## Installation

All hail Vagrant and Puppet for making it possible for me to share this simple recipe.

```
git clone https://github.com/pkkummermo/grafana-vagrant-puppet-box.git
cd grafana-vagrant-puppet-box
vagrant up
vagrant provision
open http://localhost:9100/ to see Graphite running
open http://localhost:9100/grafana/ to see Grafana running
```

## SETUP
You must take into account your own needs for a graphite server. In short: this is a simple wireframe which you should put your personal touch to :)

## Contributors
Glorious thanks to original creators jimdo and liuggio for creating the original file making it easy for me to build atop of it. All git history shows their work :)

Original repo: https://github.com/Jimdo/vagrant-statsd-graphite-puppet.git
