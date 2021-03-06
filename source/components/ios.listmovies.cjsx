'use strict'


React   = require 'react-native'
Store   = require('react-native-store')
styles  = require '../styles/index'
{
  ActivityIndicatorIOS,
  Image,
  ListView,
  Text,
  TouchableHighlight,
  View,
} = React


module.exports = React.createClass

  getDefaultProps: ->
    dataSource: new ListView.DataSource rowHasChanged: (row1, row2) => row1 isnt row2

  render: ->
    <ListView
      dataSource={@props.dataSource}
      renderRow={@renderItem}
      automaticallyAdjustContentInsets={false}
      showsVerticalScrollIndicator={false}
      style={styles.ListMovies}
    />

  renderItem: (movie) ->
    <TouchableHighlight
      activeOpacity='50'
      underlayColor='#ffc414'
      onPress={=> @onItem(movie)}>
      <View style={styles.listItem}>
        <Image
          source={{uri: movie.posters.thumbnail}}
          style={styles.thumbnail}
        />
        <View style={styles.rightContainer}>
          <Text style={styles.title}>{movie.title}</Text>
          <Text style={[styles.label, styles.opacity]}>{movie.year}</Text>
        </View>
      </View>
    </TouchableHighlight>

  onItem: (movie) ->
    @props.navigator.push
      title             : movie.title
      component         : require './ios.screenmovie'
      passProps         : movie: movie
      rightButtonTitle  : if movie._id? then 'Delete' else 'Save'
      onRightButtonPress: =>
        Store.table("items").then (movies) =>
          if movie._id then movies.removeById movie._id else movies.add movie
          @props.navigator.pop()
