'use strict';

const autoprefixer = require('autoprefixer');
const colorFunction = require('postcss-color-function');
const cssnano = require('cssnano');
const customProperties = require('postcss-custom-properties');
const easyImport = require('postcss-easy-import');

const postcssOptions = {
  compile: {
    enable: true,
    plugins: [
      { module: easyImport },
      { module: customProperties, options: { preserve: false } },
      { module: colorFunction },
      { module: autoprefixer, options: { overrideBrowserslist: ['last 2 versions'] } },
      { module: cssnano },
    ]
  }
};

module.exports = {
  name: require('./package').name,

  options: {
    postcssOptions
  },

  //TODO: Not sure if we need this anymore since this lives in ember-cli-build now
  config(env, config) {
    if(!config['responsive-image']) {
      return {
        'responsive-image': {
          fingerprint: false,
          deviceWidths: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
          images: [
            {
              include: ['images/**/*'],
              widths: [2000, 1000, 600, 300],
              formats: ['jpg', 'jpeg', 'png'],
              quality: 80,
              lqip: {
                type: 'inline',
                targetPixels: 60,
              },
              removeSource: false,
              justCopy: false,
            }
          ]
        }
      }
    }
  },

  included(app) {
    this._super.included.apply(this, arguments)

    app.options.postcssOptions = postcssOptions;
  },
};
