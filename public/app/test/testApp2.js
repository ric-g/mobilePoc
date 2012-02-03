(function() {
  var doOnReady;

  Ext.ns('cv', 'cv.views', 'cv.controllers');

  Ext.application({
    name: 'cv',
    defaultTarget: 'viewport',
    init: function() {
      return console.log('init application');
    },
    launch: function() {
      console.log('launch');
      return Ext.create('cv.Viewport');
    }
  });

  Ext.define('cv.TitleBar', {
    extend: 'Ext.TitleBar',
    xtype: 'cvTitleBar',
    docked: 'top',
    title: 'Citivelocity',
    height: 40
  });

  Ext.define('cv.Viewport', {
    extend: 'Ext.Panel',
    alias: 'viewport',
    config: {
      fullscreen: true,
      layout: 'card',
      items: [
        {
          xtype: 'cvNavigation'
        }
      ]
    }
  });

  Ext.define('cv.navigation', {
    extend: 'Ext.navigation.View',
    xtype: 'cvNavigation',
    config: {
      id: 'cvNavigationID',
      items: [
        {
          title: 'CitiVelocity',
          items: [
            {
              xtype: 'button',
              layout: 'fit',
              text: 'ok',
              ui: 'round',
              handler: function() {
                return console.log('ok button');
              }
            }, {
              dock: 'bottom',
              xtype: 'cvMenu'
            }
          ]
        }
      ]
    }
  });

  Ext.define('cv.Menu', {
    extend: 'Ext.Toolbar',
    xtype: 'cvMenu',
    config: {
      id: 'cvMenu',
      scroll: 'horizontal',
      cls: 'testbutton'
    },
    getMenuItems: function() {
      var menuItems, menus,
        _this = this;
      console.log('getMenuItems');
      menus = ['M', 'N'];
      menuItems = [];
      menus.forEach(function(page, i) {
        var newId;
        newId = 'menu-' + page;
        menuItems.push({
          id: newId,
          text: page,
          handler: _this.menuTapHandler
        });
        return menuItems[0]['pressed'] = true;
      });
      return menuItems;
    },
    menuTapHandler: function(button, e) {
      console.log(button._text + ' ' + button.id + ' is clicked');
      return console.log(e);
    },
    constructor: function(config) {
      console.log('menu constructor');
      config.items = [
        {
          id: 'menuBarButtons',
          itemId: 'menuBarButtons',
          xtype: 'segmentedbutton',
          items: this.getMenuItems()
        }
      ];
      return this.superclass.constructor.apply(this, arguments);
    }
  });

  doOnReady = function(fn, scope, options) {
    return console.log('onready');
  };

  Ext.onReady(doOnReady);

}).call(this);
