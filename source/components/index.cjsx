'use strict'

React = require('react-native')
{
  ActivityIndicatorIOS,
  AppRegistry,
  Image,
  ListView,
  Text,
  TouchableHighlight,
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
          style={[app.styles.centering]}
          size="large"
        />
      )

    <ListView
      dataSource={@state.dataSource}
      renderRow={@renderMovie}
      style={app.styles.listView}
    />

  renderMovie: (movie, sectionID, rowID) ->
    <TouchableHighlight underlayColor='#f00' onPress={=> @onMovie(rowID)}>
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
    </TouchableHighlight>


  onMovie: (rowID) ->
    console.log "rowID", rowID, @state.dataSource

AppRegistry.registerComponent 'reactFilmit', => reactFilmit
