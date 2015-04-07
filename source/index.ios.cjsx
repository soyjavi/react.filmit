'use strict'

React         = require 'react-native'
screenMovies  = require './dist/components/ios.screenmovies'
styles        = require './dist/styles/index'

app = React.createClass
  render: ->
    <React.NavigatorIOS
      style={styles.navigator}
      initialRoute={{
        title: 'Filmit',
        component: screenMovies,
      }}
    />

React.AppRegistry.registerComponent 'reactFilmit', => app
