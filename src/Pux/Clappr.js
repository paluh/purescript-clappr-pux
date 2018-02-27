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
    var opts = {};
    if (this.player) {
      this.destroyPlayer();
    }
    // XXX: dirty hack to add parent reference to config
    // we don't want to change NativeOptions structure
    // in Clappr module as it complicates a lot
    // plugins configuration/setup.
    for (var key in props) {
        if (props.hasOwnProperty(key)) {
            opts[key] = props[key];
        }
    }
    opts.parent = this.refs.player;
    this.player = new clappr.Player(opts);
  },
  render: function render() {
    return React.createElement(
      'div',
      null,
      React.createElement('div', { ref: 'player' })
    );
  }
});
