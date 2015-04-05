'use strict'

React = require 'react-native'
{
  ActivityIndicatorIOS,
  Image,
  ListView,
  Text,
  TouchableHighlight,
  View,
} = React

styles = require '../styles/index'

REQUEST_URL = 'https://raw.githubusercontent.com/facebook/react-native/master/docs/MoviesExample.json'

module.exports = React.createClass

  getInitialState: ->
    dataSource: new ListView.DataSource rowHasChanged: (row1, row2) => row1 isnt row2
    loaded    : false

  componentDidMount: ->
    @fetchData()

  fetchData: ->
    fetch(REQUEST_URL)
      .then (response) => response.json()
      .then (responseData) =>
        @setState
          dataSource: @state.dataSource.cloneWithRows(responseData.movies)
          loaded    : true
      .done()

  render: ->
    unless @state.loaded
      return (
        <ActivityIndicatorIOS
          animating=true
          style={[styles.centering]}
          size="large"
        />
      )

    <ListView
      dataSource={@state.dataSource}
      renderRow={@renderMovie}
      style={styles.listView}
    />

  renderMovie: (movie, sectionID, rowID) ->
    <TouchableHighlight activeOpacity='50' underlayColor='#f00' onPress={=> @onMovie(rowID)}>
      <View style={styles.container}>
        <Image
          source={{uri: movie.posters.thumbnail}}
          style={styles.thumbnail}
        />
        <View style={styles.rightContainer}>
          <Text style={styles.title}>{movie.title}</Text>
          <Text style={styles.year}>{movie.year}</Text>
        </View>
      </View>
    </TouchableHighlight>

  onMovie: (rowID) ->
    console.log "rowID", rowID, @state.dataSource
