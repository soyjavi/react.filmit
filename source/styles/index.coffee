StyleSheet = require('react-native').StyleSheet

C =
  BACKGROUND: '#F5FCFF'

module.exports = StyleSheet.create

  navigator:
    flex            : 1
    backgroundColor : C.BACKGROUND
    tintColor       : '#00f'

  container:
    flex            : 1
    backgroundColor : '#0f0'

  containerEmpty:
    flex            : 1
    flexDirection   : 'row'
    justifyContent  : 'center'
    alignItems      : 'center'
    fontSize        : 128

  movieListElement  :
    flex            : 1
    flexDirection   : 'row'
    justifyContent  : 'center'
    alignItems      : 'center'
    backgroundColor : '#f00'

  rightContainer    :
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
    marginTop       : 0
    backgroundColor : C.BACKGROUND

  # -- SearchBar
  searchBar:
    marginTop       : 64
    marginBottom    : 0
    padding         : 3
    paddingLeft     : 8
    flexDirection   : 'row'
    alignItems      : 'center'

  searchBarInput:
    fontSize        : 15
    flex            : 1
    height          : 32
  searchBarSpinner:
    width           : 32

  # -- Loading
  centering:
    alignItems      : 'center'
    justifyContent  : 'center'
    height          : 128

  highlight:
    backgroundColor           : '#f00'
