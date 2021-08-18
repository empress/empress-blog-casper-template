/* eslint-env node */
const { applyBuildConfig } = require('empress-blueprint-helpers');

module.exports = {
  description: 'The default blueprint for empress-blog-casper-template.',

  normalizeEntityName() {
    // no-op
  },

  async afterInstall() {
    await this.addAddonsToProject({
      packages: [
        'ember-responsive-image',
      ]
    });

    applyBuildConfig(this.project, 'responsive-image', {
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
    });
  },
};
