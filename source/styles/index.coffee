StyleSheet = require('react-native').StyleSheet

app.styles = StyleSheet.create
  container:
    flex            : 1
    flexDirection   : 'row'
    justifyContent  : 'center'
    alignItems      : 'center'
    backgroundColor : '#F5FCFF'

  rightContainer:
    flex            : 1
    marginLeft      : 10

  thumbnail:
    width           : 53
    height          : 81

  title:
    fontSize        : 18
    marginBottom    : 4

  year:
    fontSize        : 12
    opacity         : 0.5

  listView:
    paddingTop      : 20
    backgroundColor : '#fff'
