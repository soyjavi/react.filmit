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
screenMovie   = require './ios.screenmovie'
SearchBar     = require './ios.searchbar'

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
    if @state.isLoading
      content =
        <View style={styles.containerEmpty}>
          <Text>No films</Text>
        </View>
    else
      content = <ListView
                  ref="list"
                  dataSource={@state.dataSource}
                  renderRow={@renderMovie}
                  automaticallyAdjustContentInsets={false}
                  showsVerticalScrollIndicator={false}
                  style={styles.listView}
                />

    <View style={styles.container}>
      <SearchBar
        onSearchChange={@onSearchChange}
        isLoading={@state.isLoading}
        onFocus={@onSearchFocus}
      />
      <View style={styles.separator} />
      {{content}}
    </View>
    # <TabBarIOS>
    #   <TabBarIOS.Item title="Blue Tab">
    #     <View style={styles.tabContent}>
    #       <Text>asddd</Text>
    #     </View>
    #   </TabBarIOS.Item>
    #   <TabBarIOS.Item systemIcon="history" badge={23}>
    #     <Text>asldk</Text>
    #   </TabBarIOS.Item>
    # </TabBarIOS>

  renderMovie: (movie, sectionID, rowID) ->
    # onSelect
    <TouchableHighlight activeOpacity='50' underlayColor='#f00' onPress={=> @onMovie(movie)}>
      <View style={styles.movieListElement}>
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
  onMovie: (data) ->
    @props.navigator.push
      title     : data.title
      component : screenMovie
      passProps : movie: data

  onSearchChange: (event) ->
    filter = event.nativeEvent.text.toLowerCase()
    clearTimeout @timeoutID
    @timeoutID = setTimeout (=> @searchMovies filter), 100

  onSearchFocus: ->
    console.log @refs.list
    @refs.listview.getScrollResponder().scrollTo(0, 0)
