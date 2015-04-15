'use strict'

React         = require 'react-native'
ListMovies    = require './ios.listmovies'
styles        = require '../styles/index'
{
  ActivityIndicatorIOS,
  Image,
  ListView,
  ScrollView,
  Text,
  TouchableHighlight,
  View,
} = React


module.exports = React.createClass

  getInitialState: ->
    dataSource: new ListView.DataSource rowHasChanged: (row1, row2) => row1 isnt row2
    similars  : 0
    isLoading : true

  componentDidMount: ->
    @fetchSimilar @props.movie.links.similar

  render: ->
    poster = @props.movie.posters?.original
    key = '/54x80/'
    poster = "http://" + poster.substring poster.indexOf(key) + key.length

    <ScrollView>
      <View>
        <Image source={{uri: poster}} style={styles.poster}></Image>
        <View style={styles.content}>
          <View style={[styles.row, styles.title, styles.bold]}>
            <Text style={[styles.title, styles.bold]}>{@props.movie.title}</Text>
            <Text style={[styles.title, styles.bold, styles.opacity]}> ({@props.movie.year})</Text>
          </View>
          <View style={[styles.opacity, styles.row, styles.marginBottom]}>
            <Text style={styles.label}>{@props.movie.runtime}m</Text>
          </View>
          {
            if @props.movie.synopsis isnt ""
              <Text style={styles.marginBottom}>{@props.movie.synopsis}</Text>
          }
          {
            if @state.similars
              <View>
                <Text style={[styles.label, styles.opacity, styles.marginBottom]}>Similars</Text>
                <ListMovies ref="list" dataSource={@state.dataSource} navigator={@props.navigator} />
              </View>
            else if @state.isLoading
              <ActivityIndicatorIOS
                animating={true}
                size='large'
                style={styles.centered}
              />
          }
        </View>
      </View>
    </ScrollView>

  fetchSimilar: (url) ->
    KEY = '7waqfqbprs7pajbz28mqf6vz'
    url = "#{url}?apikey=#{KEY}&limit=5"

    fetch(url)
      .then (response) => response.json()
      .then (responseData) =>
        @setState isLoading : false
        if responseData?.movies?.length > 0
          @setState
            dataSource: @state.dataSource.cloneWithRows(responseData.movies)
            similars  : responseData.movies.length
      .done()
