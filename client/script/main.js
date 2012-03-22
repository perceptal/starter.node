require.config({
  baseUrl:        "script/",
  paths: {
    jquery:       "lib/jquery-1.7.1"
  , underscore:   "lib/underscore-1.3.1"
  , backbone:     "lib/backbone-0.9.1"
  , handlebars:   "lib/handlebars-1.0.0.beta.6"
  , text:         "lib/require-text-1.0.7"
  , domready:     "lib/require-domready-1.0.0"
  , order:        "lib/require-order-1.0.5"
  , i18n:         "lib/require-i18n-1.0.0"
  , cs:           "lib/require-cs-0.3.2"
  },
  waitSeconds: 1,

  // For easier development, disable browser caching:
  urlArgs: 'bust=' +  (new Date()).getTime()
});

require(["domready", "cs!app"], function(domready, app) {
  domready(function() { app.initialize(); });
});