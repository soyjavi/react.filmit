'use strict'

React         = require 'react-native'
{
  Image,
  ScrollView,
  Text,
  View,
} = React

styles        = require '../styles/index'

module.exports = React.createClass

  render: ->
    console.log "render.movie", @props
    <ScrollView>
      <View>
        <Image
          source={{uri: @props.movie.posters.detailed}}
          style={styles.thumbnail}
        />
        <Text>{@props.movie.title}</Text>
        <Text>{@props.movie.runtime}</Text>
        <Text>{@props.movie.synopsis}</Text>
      </View>
    </ScrollView>
