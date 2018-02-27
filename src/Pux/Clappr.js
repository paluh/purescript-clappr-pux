/* global exports */
"use strict";

// module Pux.Clappr

var React = require('react');
var createReactClass = require('create-react-class');
var equal = require('fast-deep-equal');
var clappr = require('clappr');

exports.clapprImpl = createReactClass({
  shouldComponentUpdate: function(nextProps, nextState) {
    this.props = nextProps;
    this.state = nextState;
    if (!equal(nextProps, this.props)) {
      this.change(nextProps);
    }
    return false;
  },
  componentDidMount: function() {
    this.change(this.props);
  },
  componentWillUnmount: function() {
    this.destroyPlayer();
  },
  destroyPlayer: function destroyPlayer() {
    if (this.player) {
      this.player.destroy();
    }
    this.player = null;
  },
  change: function change(props) {
    if (this.player) {
      this.destroyPlayer();
    }
    this.player = new clappr.Player(props);
  },
  render: function render() {
    return React.createElement(
      'div',
      null,
      React.createElement('div', { ref: 'player' })
    );
  }
});
