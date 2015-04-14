'use strict'


React         = require 'react-native'
styles        = require '../styles/index'
{
  NavigatorIOS,
  TabBarIOS,
  Text,
  View,
} = React


module.exports = React.createClass

  getInitialState: ->
    selected : 'search'

  render: ->
    <TabBarIOS
      style={styles.tabBarIOS}
      selected={@state.selected}
    >
      <TabBarIOS.Item
        title='Search'
        icon={_icon 'search'}
        selected={@state.selected is 'search'}
        onPress={@onTab.bind(@, 'search')}>
        <View></View>
      </TabBarIOS.Item>
      <TabBarIOS.Item
        icon={_icon 'bookmarks'}
        title='Pending'
        badgeValue={@props.pending}
        selected={@state.selected is 'pending'}
        onPress={@onTab.bind(@, 'pending')}>
        <View></View>
      </TabBarIOS.Item>
    </TabBarIOS>

  onTab: (tab) ->
    @setState selected: tab
    @props.callback tab

_icon = (imageUri) ->
  uri     : imageUri
  isStatic: true
