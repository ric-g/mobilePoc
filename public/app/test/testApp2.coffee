#namespace
Ext.ns('cv','cv.views','cv.controllers')

#seems most of properties are used for apple device
#Ext.setup
		#statusBarStyle:Sets the status bar style for fullscreen iPhone OS web apps
#    statusBarStyle: 'black-translucent'
#    onReady: ->
#        console.log 'test ready'

#Ext.setup: launch a basic application.
#if call Ext.setup, can't call Ext.application again
#Ext.application
#    name: 'cv'
#    launch: ->
#        console.log 'application test'

Ext.application
    name: 'cv'
    defaultTarget: 'viewport'
    init: ->
     console.log 'init application'
    #controllers: ['page']
    launch: ->
        console.log 'launch'
        Ext.create('cv.Viewport')

Ext.define('cv.TitleBar',
 extend: 'Ext.TitleBar'
 xtype: 'cvTitleBar'
 docked: 'top'
 title: 'Citivelocity'
 height: 40
)

Ext.define('cv.Viewport',
 extend: 'Ext.Panel'
 alias: 'viewport'
 config: 
        fullscreen: true,
        layout: 'card',
        items: [
         #{xtype: 'cvTitleBar'}
         {xtype: 'cvNavigation'}
        ]
 
)

Ext.define('cv.navigation'
 extend: 'Ext.navigation.View'
 xtype: 'cvNavigation'
 config:
  id: 'cvNavigationID'
  items: [
   title: 'CitiVelocity'
   items: [
    {
     xtype: 'button'
     layout: 'fit'
     text: 'ok'
     ui: 'round'
     handler: ->
      console.log 'ok button'
     }
     {dock: 'bottom', xtype: 'cvMenu'}
   ]
  ]
)


Ext.define('cv.Menu'
 extend: 'Ext.Toolbar'
 xtype: 'cvMenu'
 config:
  id: 'cvMenu'
  #layout: 'fix'
  scroll: 'horizontal'
  cls: 'testbutton'
 getMenuItems: ->
   console.log 'getMenuItems'
   menus = ['M','N']
   menuItems = []
   menus.forEach (page, i)=>
    newId = 'menu-'+page
    menuItems.push({id: newId, text: page, handler: @menuTapHandler})
    menuItems[0]['pressed'] = true
   return menuItems
  menuTapHandler: (button, e)->
   console.log (button._text + ' ' + button.id + ' is clicked')
   console.log (e)
  constructor: (config) ->
   console.log 'menu constructor'
   config.items=[
    id: 'menuBarButtons'
    itemId: 'menuBarButtons'
    xtype: 'segmentedbutton'
    items: @getMenuItems()
   ]
   @superclass.constructor.apply(this,arguments)

)


doOnReady = (fn,scope,options) ->
 console.log 'onready'
Ext.onReady(doOnReady)