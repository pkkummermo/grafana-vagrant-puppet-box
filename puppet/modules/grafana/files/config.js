///// @scratch /configuration/config.js/1
// == Configuration
// config.js is where you will find the core Grafana configuration. This file contains parameter that
// must be set before Grafana is run for the first time.
///
define(['settings'], function (Settings) {
    return new Settings({
        datasources: {
            graphite: {
                type: "graphite",
                url: "http://localhost:9100",
                default: true
            }
        },
        default_route: '/dashboard/file/default.json',
        elasticsearch: "http://localhost:9200",
        grafana_index: "grafana-dash",
        timezoneOffset: null,
        unsaved_changes_warning: true,
        playlist_timespan: "1m",
        plugins: {
            panels: []
        }
    });
});
