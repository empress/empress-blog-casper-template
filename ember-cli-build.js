'use strict';

const EmberAddon = require('ember-cli/lib/broccoli/ember-addon');

module.exports = function(defaults) {
  let app = new EmberAddon(defaults, {
    fingerprint: {
      extensions: ['js', 'css', 'map']
    },
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
  });

  /*
    This build file specifies the options for the dummy test app of this
    addon, located in `/tests/dummy`
    This build file does *not* influence how the addon or the app using it
    behave. You most likely want to be modifying `./index.js` or app's build file
  */

  return app.toTree();
};
