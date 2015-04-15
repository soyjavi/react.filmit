'use strict'

React         = require 'react-native'
Store         = require('react-native-store')
SearchBar     = require './ios.searchbar'
ListMovies    = require './ios.listmovies'
Footer        = require './ios.footer'
styles        = require '../styles/index'
{
  ActivityIndicatorIOS,
  Image,
  ListView,
  NavigatorIOS,
  TabBarIOS,
  Text,
  TouchableHighlight,
  View,
} = React

API           =
  URL         : 'http://api.rottentomatoes.com/api/public/v1.0/'
  KEY         : '7waqfqbprs7pajbz28mqf6vz'
search        = []

module.exports = React.createClass

  getInitialState: ->
    dataSource  : new ListView.DataSource rowHasChanged: (row1, row2) => row1 isnt row2
    isLoading   : true
    pending     : 0
    selectedTab : 'search'

  componentDidMount: ->
    do @searchMovies

  componentDidUpdate: ->
    Store.table("items").then (items) =>
      @setState pending: items.databaseData.items.totalrows

  render: ->
    <View style={styles.container}>
      <SearchBar
        onSearchChange={@onSearchChange}
        isLoading={@state.isLoading}
        onFocus={@onSearchFocus}
      />
      <View style={styles.separator} />
      <ListMovies
        ref='list'
        dataSource={@state.dataSource}
        navigator={@props.navigator} />
      <Footer
        selected={@state.selectedTab}
        navigator={@props.navigator}
        pending={@state.pending}
        callback={@onContext}
      />
    </View>

  searchMovies: (query) ->
    clearTimeout @timeoutID
    @setState isLoading: true
    if query
      url = 'movies.json?apikey=' + API.KEY + '&q=' + encodeURIComponent(query) + '&page_limit=32&page=1'
    else
      url = 'lists/movies/in_theaters.json?apikey=' + API.KEY + '&page_limit=32&page=1'
    url = API.URL + url
    fetch(url)
      .then (response) => response.json()
      .then (responseData) =>
        search = responseData.movies
        @setState
          dataSource: @state.dataSource.cloneWithRows search
          isLoading : false
      .done()

  # -- Events
  onSearchChange: (event) ->
    filter = event.nativeEvent.text.toLowerCase()
    if filter.length > 1
      clearTimeout @timeoutID
      @timeoutID = setTimeout (=> @searchMovies filter), 250

  onSearchFocus: ->
    @refs.list.getScrollResponder().scrollTo(0, 0)

  onContext: (tab) ->
    if tab is 'pending'
      Store.table("items").then (items) =>
        movies = (data for id, data of items.databaseData.items.rows)
        @setState dataSource: @state.dataSource.cloneWithRows movies
    else
      @setState dataSource: @state.dataSource.cloneWithRows search
