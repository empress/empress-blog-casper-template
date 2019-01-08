'use strict';

const autoprefixer = require('autoprefixer');
const colorFunction = require('postcss-color-function');
const cssnano = require('cssnano');
const customProperties = require('postcss-custom-properties');
const postcssImport = require('postcss-import');

module.exports = {
  name: require('./package').name,

  options: {
    postcssOptions: {
      compile: {
        enable: true,
        plugins: [
          { module: postcssImport },
          { module: customProperties },
          { module: colorFunction },
          { module: autoprefixer },
          { module: cssnano },
        ]
      }
    }
  },

  config(env, config) {
    if(!config['responsive-image']) {
      return {
        'responsive-image': {
          sourceDir: 'images',
          destinationDir: 'responsive-images',
          quality: 80,
          supportedWidths: [2048, 1536, 1080, 750, 640, 320, 150],
          removeSourceDir: false,
          justCopy: false,
          extensions: ['jpg', 'jpeg', 'png', 'gif']
        }
      }
    }
  },

  included(app) {
    this._super.included.apply(this, arguments)

    app.options.postcssOptions = Object.assign({
        compile: {
          enable: true,
          plugins: [
            { module: postcssImport },
            { module: customProperties },
            { module: colorFunction },
            { module: autoprefixer },
            { module: cssnano },
          ]
        }
      },
      app.options.postcssOptions
    );
  },
};
