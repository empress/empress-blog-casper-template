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

  included() {
    let app = findHost(this);

    app.options['responsive-image'] = {
      images: [{
        include: 'images/**/*',
        removeSource: false,
        quality: 80,
        widths: [2000, 1000, 600, 300],
      }]
    };

    app.options.postcssOptions = postcssOptions;

    this._super.included.apply(this, arguments);
  },

  contentFor() {
    let responsiveImage = this.addons.find((a) => a.name === 'ember-responsive-image');
    return responsiveImage.contentFor(...arguments);
  },
};

// Polyfill [Addon._findHost](https://ember-cli.com/api/classes/Addon.html#method__findHost) for older versions of ember-cli
function findHost(addon) {
  var current = addon;
  var app;

  do {
    app = current.app || app;
  } while (current.parent.parent && (current = current.parent));

  return app;
}
