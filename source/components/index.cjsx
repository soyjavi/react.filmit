'use strict'

React = require('react-native')
{
  AppRegistry,
  Image,
  ListView,
  Text,
  View,
} = React

REQUEST_URL = 'https://raw.githubusercontent.com/facebook/react-native/master/docs/MoviesExample.json'

reactFilmit = React.createClass

  getInitialState: ->
    dataSource: new ListView.DataSource rowHasChanged: (row1, row2) => row1 isnt row2
    loaded    : false

  componentDidMount: ->
    @fetchData()

  fetchData: ->
    @setState loaded: false
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
        <View style={app.styles.container}>
          <Text>
            Loading movies...
          </Text>
        </View>
      )

    return (
      <ListView
        dataSource={@state.dataSource}
        renderRow={@renderMovie}
        style={app.styles.listView}
      />
    )

  renderMovie: (movie) ->
    return (
      <View style={app.styles.container}>
        <Image
          source={{uri: movie.posters.thumbnail}}
          style={app.styles.thumbnail}
        />
        <View style={app.styles.rightContainer}>
          <Text style={app.styles.title}>{movie.title}</Text>
          <Text style={app.styles.year}>{movie.year}</Text>
        </View>
      </View>
    )

AppRegistry.registerComponent 'reactFilmit', => reactFilmit
