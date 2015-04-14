'use strict'

React         = require 'react-native'
styles        = require './dist/styles/index'

app = React.createClass
  render: ->
    <React.NavigatorIOS
      style={styles.navigator}
      tintColor='yellow'
      initialRoute={{
        title     : 'Filmit'
        component : require './dist/components/ios.screenmovies'
      }}
    />

React.AppRegistry.registerComponent 'reactFilmit', => app
