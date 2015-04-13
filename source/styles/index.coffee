StyleSheet = require('react-native').StyleSheet

C =
  BACKGROUND: '#F5FCFF'

module.exports = StyleSheet.create

  navigator:
    flex            : 1
    backgroundColor : C.BACKGROUND
    # tintColor       : '#00f'

  container:
    flex            : 1

  containerEmpty:
    flex            : 1
    flexDirection   : 'row'
    justifyContent  : 'center'
    alignItems      : 'center'
    fontSize        : 128

  # -- SearchBar
  searchBar:
    marginTop       : 64
    marginBottom    : 1
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

  # -- ListItem
  movieListElement  :
    flex            : 1
    flexDirection   : 'row'
    justifyContent  : 'center'
    alignItems      : 'center'

  rightContainer    :
    flex            : 1
    marginLeft      : 10

  thumbnail:
    width           : 48
    height          : 72

  title:
    fontSize        : 18
    marginBottom    : 4

  year:
    fontSize        : 12
    opacity         : 0.5

  separator:
    height          : 1
    backgroundColor : '#EEEEEE'

  listView:
    flex            : 2

  tabContent:
    flex            : 1
    alignItems      : 'center'
    backgroundColor : '#f00'

  tabBarIOSItem:
    color: 'red'
    margin: 50

  # -- Loading
  centering:
    alignItems      : 'center'
    justifyContent  : 'center'
    height          : 128

  highlight:
    backgroundColor : '#f00'

  # -- Movie
  content:
    padding         : 10

  poster:
    height          : 256
