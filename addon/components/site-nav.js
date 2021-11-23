/* eslint-disable ember/no-classic-components, ember/no-classic-classes, ember/require-tagless-components, prettier/prettier */
import Component from '@ember/component';
import { inject as service } from '@ember/service';
import { computed } from '@ember/object';
import { equal } from '@ember/object/computed';
import layout from '../templates/components/site-nav';

export default Component.extend({
  blog: service(),
  router: service(),
  isHome: equal('router.currentRouteName', 'index'),
  rssFeed: computed('blog.host', function() {
    return `https://feedly.com/i/subscription/feed${encodeURIComponent(`/${this.blog.host}/rss.xml`)}`;
  }),
  layout
});
