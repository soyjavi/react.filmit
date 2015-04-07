'use strict'

React = require 'react-native'
{
  ScrollView,
  Text,
  View,
} = React

module.exports = React.createClass

  render: ->
    <ScrollView>
      <View>
        <Text>Second Screen</Text>
      </View>
    </ScrollView>
