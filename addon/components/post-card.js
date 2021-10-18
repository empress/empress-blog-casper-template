/* eslint-disable ember/no-classic-components, ember/no-classic-classes */
import Component from '@ember/component';
import { computed } from '@ember/object';
import { inject as service } from '@ember/service';

import layout from '../templates/components/post-card';

export default Component.extend({
  layout,

  router: service(),
  tagName: '',

  isHome: computed.equal('router.currentRouteName', 'index'),
});
