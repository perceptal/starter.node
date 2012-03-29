Marionette.Region = function(options){
    this.options = options || {};

    _.extend(this, options);

    if (!this.el){
        var err = new Error("An 'el' must be specified");
        err.name = "NoElError";
        throw err;
    }
};

_.extend(Marionette.Region.prototype, Backbone.Events, {

    // Displays a backbone view instance inside of the region.
    // Handles calling the `render` method for you. Reads content
    // directly from the `el` attribute. Also calls an optional
    // `onShow` and `close` method on your view, just after showing
    // or just before closing the view, respectively.
    show: function(view, appendMethod){
        this.ensureEl();

        this.close();
        this.open(view, appendMethod);

        this.currentView = view;
    },

    ensureEl: function(){
        if (!this.$el || this.$el.length == 0){
            this.$el = this.getEl(this.el);
        }
    },

    // Override this method to change how the region finds the
    // DOM element that it manages. Return a jQuery selector object.
    getEl: function(selector){
        return $(selector);
    },

    // Internal method to render and display a view. Not meant 
    // to be called from any external code.
    open: function(view, appendMethod){
        var that = this;
        appendMethod = appendMethod || "html";

        $.when(view.render()).then(function () {
            that.$el[appendMethod](view.el);
            view.onShow && view.onShow();
            view.trigger("show");
            that.trigger("view:show", view);
        });
    },

    // Close the current view, if there is one. If there is no
    // current view, it does nothing and returns immediately.
    close: function(){
        var view = this.currentView;
        if (!view){ return; }

        view.close && view.close();
        this.trigger("view:closed", view);

        delete this.currentView;
    },

    // Attach an existing view to the region. This 
    // will not call `render` or `onShow` for the new view, 
    // and will not replace the current HTML for the `el`
    // of the region.
    attachView: function(view){
        this.currentView = view;
    }
});
