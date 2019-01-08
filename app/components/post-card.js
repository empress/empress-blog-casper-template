import Component from '@ember/component';
import { inject as service } from '@ember/service';
import { computed } from '@ember/object';

export default Component.extend({
  blog: service(),
  router: service(),
  url: service(),
  tagName: '',
  image: computed('post.image', function() {
    return this.get('post.image').replace(/^\/images\//, '')
  })
})
