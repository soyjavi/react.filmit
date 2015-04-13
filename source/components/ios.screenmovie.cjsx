'use strict'

React         = require 'react-native'
{
  Image,
  ListView,
  ScrollView,
  Text,
  View,
} = React

styles        = require '../styles/index'

module.exports = React.createClass

  getInitialState: ->
    dataSource: new ListView.DataSource rowHasChanged: (row1, row2) => row1 isnt row2
    isLoading : true

  componentDidMount: ->
    @fetchSimilar @props.movie.links.similar

  render: ->
    <ScrollView>
      <View>
        <Image
          source={{uri: @props.movie.posters.detailed}}
          style={styles.poster}
        />
        <View style={styles.content}>
          <Text style={styles.title}>{@props.movie.title}</Text>
          <View style={styles.year}>
            <Text>{@props.movie.year} - </Text><Text>{@props.movie.runtime}m</Text>
          </View>
          <Text>{@props.movie.synopsis}</Text>

          <Text>Similars</Text>
          <ListView
            ref="list"
            dataSource={@state.dataSource}
            renderRow={@renderSimilar}
            automaticallyAdjustContentInsets={false}
            showsVerticalScrollIndicator={false}
          />
        </View>
      </View>
    </ScrollView>

  fetchSimilar: (url) ->
    KEY = '7waqfqbprs7pajbz28mqf6vz'
    url = "#{url}?apikey=#{KEY}&limit=32"
    fetch(url)
      .then (response) => response.json()
      .then (responseData) =>
        @setState
          dataSource: @state.dataSource.cloneWithRows(responseData.movies)
          isLoading : false
      .done()

  renderSimilar: (movie, sectionID, rowID) ->
    <View>
      <Image
        source={{uri: movie.posters.thumbnail}}
        style={styles.thumbnail}
      />
      <View style={styles.rightContainer}>
        <Text style={styles.title}>{movie.title}</Text>
        <Text style={styles.year}>{movie.year}</Text>
      </View>
    </View>
