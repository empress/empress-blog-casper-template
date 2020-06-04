import Component from '@ember/component';
import { inject as service } from '@ember/service';
import { computed } from '@ember/object';
import layout from '../templates/components/site-nav';

export default Component.extend({
  blog: service(),
  router: service(),
  isHome: computed.equal('router.currentRouteName', 'index'),
  rssFeed: computed('blog.host', function() {
    return `https://feedly.com/i/subscription/feed${encodeURIComponent(`/${this.blog.host}/rss.xml`)}`;
  }),
  layout
});
