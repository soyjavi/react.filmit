'use strict'

React         = require 'react-native'
{
  ActivityIndicatorIOS,
  TextInput,
  View,
} = React

styles        = require '../styles/index'

module.exports = React.createClass

  render: ->
    <View style={styles.searchBar}>
      <TextInput
        autoCapitalize="none"
        autoCorrect={false}
        placeholder="Search a movie..."
        onChange={@props.onSearchChange}
        onFocus={@props.onSearchFocus}
        style={styles.searchBarInput}
      />
      <ActivityIndicatorIOS
        animating={@props.isLoading}
        style={styles.searchBarSpinner}
      />
    </View>
