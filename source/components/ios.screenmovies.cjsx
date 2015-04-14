'use strict'

React         = require 'react-native'
{
  ActivityIndicatorIOS,
  Image,
  ListView,
  TabBarIOS,
  Text,
  TouchableHighlight,
  View,
} = React

styles        = require '../styles/index'
SearchBar     = require './ios.searchbar'
ListMovies    = require './ios.listmovies'

API           =
  URL         : 'http://api.rottentomatoes.com/api/public/v1.0/'
  KEY         : '7waqfqbprs7pajbz28mqf6vz'

module.exports = React.createClass

  getInitialState: ->
    dataSource: new ListView.DataSource rowHasChanged: (row1, row2) => row1 isnt row2
    isLoading : true

  componentDidMount: ->
    do @searchMovies

  render: ->
    <View style={styles.container}>
      <SearchBar
        onSearchChange={@onSearchChange}
        isLoading={@state.isLoading}
        onFocus={@onSearchFocus}
      />
      <View style={styles.separator} />
      <ListMovies
        ref="list"
        dataSource={@state.dataSource}
        navigator={@props.navigator} />
      <TabBarIOS style={styles.tabBarIOS}>
      </TabBarIOS>
    </View>

  searchMovies: (query) ->
    @timeoutID = null
    @setState isLoading: true
    if query
      url = 'movies.json?apikey=' + API.KEY + '&q=' + encodeURIComponent(query) + '&page_limit=32&page=1'
    else
      url = 'lists/movies/in_theaters.json?apikey=' + API.KEY + '&page_limit=32&page=1'
    url = API.URL + url
    fetch(url)
      .then (response) => response.json()
      .then (responseData) =>
        @setState
          dataSource: @state.dataSource.cloneWithRows(responseData.movies)
          isLoading : false
      .done()

  # -- Events
  onSearchChange: (event) ->
    filter = event.nativeEvent.text.toLowerCase()
    clearTimeout @timeoutID
    @timeoutID = setTimeout (=> @searchMovies filter), 100

  onSearchFocus: ->
    @refs.list.getScrollResponder().scrollTo(0, 0)
