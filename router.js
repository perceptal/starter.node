Marionette.Layout = Marionette.ItemView.extend({
    constructor: function () {
        this.vent = new Backbone.Marionette.EventAggregator();
        Backbone.Marionette.ItemView.apply(this, arguments);
        this.regionManagers = {};
    },

    render: function () {
        this.initializeRegions();
        return Backbone.Marionette.ItemView.prototype.render.call(this, arguments);
    },

    close: function () {
        this.closeRegions();
        Backbone.Marionette.ItemView.prototype.close.call(this, arguments);
    },

    initializeRegions: function () {
        var that = this;
        _.each(this.regions, function (selector, name) {
            var regionManager = new Backbone.Marionette.Region({
                el: selector,

                getEl: function(selector){
                    return that.$(selector);
                }
            });
            that.regionManagers[name] = regionManager;
            that[name] = regionManager;
        });
    },

    closeRegions: function () {
        var that = this;
        _.each(this.regionManagers, function (manager, name) {
            manager.close();
            delete that[name];
        });
        this.regionManagers = {};
    }
});