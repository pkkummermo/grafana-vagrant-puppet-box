///// @scratch /configuration/config.js/1
// == Configuration
// config.js is where you will find the core Grafana configuration. This file contains parameter that
// must be set before Grafana is run for the first time.
///
define(['settings'], function (Settings) {
    var hostName = location.hostname;

    return new Settings({
        datasources: {
            graphite: {
                type: "graphite",
                url: "http://" + hostName + ":9100",
                default: true
            }
        },
        default_route: '/dashboard/elasticsearch/mona',
        elasticsearch: "http://" + hostName + ":9200",
        grafana_index: "grafana-dash",
        timezoneOffset: null,
        unsaved_changes_warning: true,
        playlist_timespan: "1m",
        plugins: {
            panels: []
        }
    });
});
