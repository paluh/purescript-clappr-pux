'use strict';

const webpack = require('webpack');
const BowerResolvePlugin = require("bower-resolve-webpack-plugin");

module.exports = function(env) {
  return {
    devtool: "inline-source-map",
    entry: './output/Main/index.js',
    output: {
      path: __dirname,
      pathinfo: true,
      filename: 'bundle.js',
      library: 'app'
    },
    mode: 'development',
    resolve: {
      modules: ['bower_components', 'node_modules'],
      descriptionFiles: ['bower.json', 'package.json'],
      plugins: [new BowerResolvePlugin()]
    }
  };
};
