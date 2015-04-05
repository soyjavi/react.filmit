StyleSheet = require('react-native').StyleSheet


C =
  BACKGROUND: '#F5FCFF'

app.styles = StyleSheet.create
  container:
    flex            : 1
    flexDirection   : 'row'
    justifyContent  : 'center'
    alignItems      : 'center'
    backgroundColor : C.BACKGROUND

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
    backgroundColor : C.BACKGROUND

  # -- Loading
  centering:
    alignItems      : 'center'
    justifyContent  : 'center'
    height          : 128

  highlight:
    backgroundColor           : '#f00'
