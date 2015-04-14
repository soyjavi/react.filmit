StyleSheet = require('react-native').StyleSheet

C =
  BACKGROUND: '#F5FCFF'

module.exports = StyleSheet.create

  # -- COMMONS -----------------------------------------------------------------
  navigator:
    flex            : 1
    backgroundColor : C.BACKGROUND
    tintColor       : 'yellow'
    flexWrap        : 'wrap'

  container:
    flex            : 1

  label:
    fontSize        : 12

  opacity:
    opacity         : 0.5

  row:
    flexDirection   : 'row'

  column:
    flexDirection   : 'column'

  marginBottom:
    marginBottom    : 10

  centered:
    flexDirection   : 'row'

  bold:
    fontWeight      : 'bold'

  # -- SCREEN.MOVIES -----------------------------------------------------------
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

  # -- ListMovies
  listMovies:
    flex            : 2

  # -- ListItem
  listItem  :
    flex            : 1
    flexDirection   : 'row'
    justifyContent  : 'center'
    alignItems      : 'center'
    marginBottom    : 1

  rightContainer    :
    flex            : 1
    marginLeft      : 10

  thumbnail:
    width           : 48
    height          : 72

  title:
    fontSize        : 18
    marginBottom    : 2

  separator:
    height          : 1
    backgroundColor : '#EEEEEE'

  tabBarIOS:
    flex            : 0
    height          : 48

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

  # -- SCREEN.MOVIE ------------------------------------------------------------
  # -- Movie
  content:
    padding         : 10

  poster:
    height          : 256

  similarItem:
    flexDirection   : 'column'
    justifyContent  : 'center'
    alignItems      : 'center'

  similarTitle:
    fontSize        : 16
