require.config({
  baseUrl:        "script/"

, hbs: {
    templateExtension: "hbs"
  , disableI18n: true
  }

, paths: {
    jquery:         "vendor/jquery-1.7.1"
  , underscore:     "vendor/underscore-1.3.1"
  , backbone:       "vendor/backbone-0.9.1"
  , Handlebars:     "vendor/handlebars-1.0.0.beta.4"
  , text:           "vendor/require-text-1.0.7"
  , domready:       "vendor/require-domready-1.0.0"
  , order:          "vendor/require-order-1.0.5"
  , i18n:           "vendor/require-i18n-1.0.0"
  , cs:             "vendor/require-cs-0.3.2"
  , hbs:            "vendor/hbs-0.2.1"
  , json2:          "vendor/json2"
  , i18nprecompile: "vendor/i18nprecompile"
  },
  waitSeconds: 1,

  // For easier development, disable browser caching:
  urlArgs: 'bust=' +  (new Date()).getTime()
});

require(["domready", "cs!controllers/application"], function(domready, ApplicationController) {
  domready(function() {
      new ApplicationController();
  });
});