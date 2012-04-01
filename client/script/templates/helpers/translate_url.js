define(["Handlebars"], function (Handlebars) {

  var translate_url = function () {
    return this.url.replace(":id", this.id);
  }

  Handlebars.registerHelper("translate_url", translate_url);

  return translate_url;
});
