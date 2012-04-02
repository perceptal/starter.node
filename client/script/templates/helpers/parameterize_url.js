define(["Handlebars"], function (Handlebars) {

  var parameterize_url = function () {
    return this.url.replace(":id", this.id);
  }

  Handlebars.registerHelper("parameterize_url", parameterize_url);

  return parameterize_url;
});
