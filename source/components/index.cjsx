'use strict'

React = require('react-native')
{
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React

ReactFilmit = React.createClass
  render: ->
    <View style={app.styles.container}>
      <Text style={app.styles.welcome}>
        Welcome to React Native!
      </Text>
      <Text style={app.styles.instructions}>
        To get started, edit index.ios.js
      </Text>
      <Text style={app.styles.instructions}>
        Press Cmd+R to reload,{'\n'}
        Cmd+Control+Z for dev menu
      </Text>
    </View>

AppRegistry.registerComponent 'ReactFilmit', () => ReactFilmit
