/* eslint-env node */
const { applyConfig } = require('empress-blueprint-helpers');

module.exports = {
  description: 'The default blueprint for empress-blog-casper-template.',

  normalizeEntityName() {
    // no-op
  },

  async afterInstall() {
    await this.addAddonsToProject({
      packages: [
        'ember-responsive-image@1',
      ]
    });

    applyConfig(this.project, 'responsive-image', {
      sourceDir: 'images',
      destinationDir: 'responsive-images',
      quality: 80,
      supportedWidths: [2000, 1000, 600, 300],
      removeSourceDir: false,
      justCopy: false,
      extensions: ['jpg', 'jpeg', 'png', 'gif'],
    });
  },
};
