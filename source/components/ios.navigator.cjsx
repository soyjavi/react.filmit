'use strict';

React = require('react-native');
ViewExample = require('./ViewExample');
{
  PixelRatio,
  ScrollView,
  StyleSheet,
  Text,
  TouchableHighlight,
  View,
} = React

# --
EmptyPage = React.createClass
  render: ->
    <View style={styles.emptyPage}>
      <Text style={styles.emptyPageText}>
        {@props.text}
      </Text>
    </View>


# --
NavigatorIOSExample = React.createClass

  statics:
    title: '<NavigatorIOS>'
    description: 'iOS navigation capabilities'

  render: ->
    recurseTitle = 'Recurse Navigation'
    recurseTitle += ' - more examples here' unless @props.topExampleRoute


    <ScrollView style={styles.list}>
      <View style={styles.line}/>
      <View style={styles.group}>
        <View style={styles.row}>
          <Text style={styles.rowNote}>
            See &lt;UIExplorerApp&gt; for top-level usage.
          </Text>
        </View>
      </View>
      <View style={styles.line}/>
      <View style={styles.groupSpace}/>
      <View style={styles.line}/>
      <View style={styles.group}>
        {@_renderRow(recurseTitle, () => {
          @props.navigator.push
            title: NavigatorIOSExample.title,
            component: NavigatorIOSExample,
            backButtonTitle: 'Custom Back',
            passProps: {topExampleRoute: @props.topExampleRoute || @props.route},
          });
        })}
        {@_renderRow('Push View Example', () => {
          @props.navigator.push
            title: 'Very Long Custom View Example Title',
            component: ViewExample,
          });
        })}
        {@_renderRow('Custom Right Button', () => {
          @props.navigator.push
            title: NavigatorIOSExample.title,
            component: EmptyPage,
            rightButtonTitle: 'Cancel',
            onRightButtonPress: () => @props.navigator.pop(),
            passProps: {
              text: 'This page has a right button in the nav bar',
            }
          });
        })}
        {@_renderRow('Pop', () => {
          @props.navigator.pop();
        })}
        {@_renderRow('Pop to top', () => {
          @props.navigator.popToTop();
        })}
        {@_renderRow('Replace here', () => {
          prevRoute = @props.route;
          @props.navigator.replace
            title: 'New Navigation',
            component: EmptyPage,
            rightButtonTitle: 'Undo',
            onRightButtonPress: () => @props.navigator.replace(prevRoute),
            passProps: {
              text: 'The component is replaced, but there is currently no ' +
                'way to change the right button or title of the current route',
            }
          });
        })}
        {@_renderReplacePrevious()}
        {@_renderReplacePreviousAndPop()}
        {@_renderPopToTopNavExample()}
      </View>
      <View style={styles.line}/>
    </ScrollView>

  _renderPopToTopNavExample: ->
    if (!@props.topExampleRoute)

      return null
    return @_renderRow('Pop to top NavigatorIOSExample', () => {
      @props.navigator.popToRoute(@props.topExampleRoute);
    });
  },

  _renderReplacePrevious: ->
    if (!@props.topExampleRoute) {
      // this is to avoid replacing the UIExplorerList at the top of the stack
      return null;
    }
    return @_renderRow('Replace previous', () => {
      @props.navigator.replacePrevious
        title: 'Replaced',
        component: EmptyPage,
        passProps: {
          text: 'This is a replaced "previous" page',
        },
        wrapperStyle: styles.customWrapperStyle,
      });
    });
  },

  _renderReplacePreviousAndPop: ->
    if (!@props.topExampleRoute) {
      // this is to avoid replacing the UIExplorerList at the top of the stack
      return null;
    return @_renderRow('Replace previous and pop', () => {
      @props.navigator.replacePreviousAndPop
        title: 'Replaced and Popped',
        component: EmptyPage,
        passProps: {
          text: 'This is a replaced "previous" page',
        },
        wrapperStyle: styles.customWrapperStyle,
      });
    });
  },

  _renderRow: (title: string, onPress: Function) ->
    <View>
      <TouchableHighlight onPress={onPress}>
        <View style={styles.row}>
          <Text style={styles.rowText}>
            {title}
          </Text>
        </View>
      </TouchableHighlight>
      <View style={styles.separator} />
    </View>


styles = StyleSheet.create
  customWrapperStyle:
    backgroundColor: '#bbdddd',
  emptyPage:
    flex: 1
    paddingTop: 64
  emptyPageText:
    margin: 10
  list:
    backgroundColor: '#eeeeee'
    marginTop: 10
  group:
    backgroundColor: 'white'
  groupSpace:
    height: 15
  line:
    backgroundColor: '#bbbbbb'
    height: 1 / PixelRatio.get()
  row:
    backgroundColor: 'white'
    justifyContent: 'center'
    paddingHorizontal: 15
    paddingVertical: 15
  separator:
    height: 1 / PixelRatio.get()
    backgroundColor: '#bbbbbb'
    marginLeft: 15
  rowNote:
    fontSize: 17
  rowText:
    fontSize: 17
    fontWeight: '500'

module.exports = NavigatorIOSExample
