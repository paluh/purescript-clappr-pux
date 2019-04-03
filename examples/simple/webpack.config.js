'use strict';

const path = require('path');
const webpack = require('webpack');
const BowerResolvePlugin = require("bower-resolve-webpack-plugin");

module.exports = function(env) {
  return {
    devtool: "inline-source-map",
    entry: path.resolve(__dirname, './output/Main/index.js'),
    output: {
      path: path.resolve(__dirname),
      pathinfo: true,
      filename: 'bundle.js',
      library: 'app'
    },
    mode: 'development',
    resolve: {
      alias: {
        Clappr: 'clappr/dist/clappr.js'
      },
      modules: ['bower_components', 'node_modules'],
      descriptionFiles: ['bower.json', 'package.json'],
      plugins: [new BowerResolvePlugin()]
    }
  };
};
