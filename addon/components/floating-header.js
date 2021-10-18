/* eslint-disable ember/no-classic-components, ember/no-classic-classes, prettier/prettier, ember/no-component-lifecycle-hooks, ember/require-super-in-lifecycle-hooks */
import Component from '@ember/component';
import { inject as service } from '@ember/service';
import { set, computed } from '@ember/object';
import layout from '../templates/components/floating-header';

export default Component.extend({
  blog: service(),
  fastboot: service(),
  value: 0,
  init() {
    this._super(...arguments);

    if(this.fastboot.isFastBoot) {
      return;
    }

    set(this, 'lastScrollY', window.scrollY);
    set(this, 'lastWindowHeight', window.innerHeight);
    set(this, 'lastDocumentHeight', document.body.scrollHeight);

    this.update();
  },

  location: computed(function() {
    return window.location;
  }),

  didInsertElement() {
    let scrollEvent = () => {
      set(this, 'lastScrollY', window.scrollY);
      this.requestTick();
    };
    set(this, 'scrollEvent', scrollEvent);
    window.addEventListener('scroll', scrollEvent, {passive: true});

    let resizeEvent = () => {
      set(this, 'lastWindowHeight', window.innerHeight);
      set(this, 'lastDocumentHeight', document.body.scrollHeight);
      this.requestTick();
    };

    set(this, 'resizeEvent', resizeEvent);

    window.addEventListener('resize', resizeEvent, false);
  },

  didDestroyElement() {
    let scrollEvent = this.scrollEvent;

    if(scrollEvent) {
      window.removeEventListener('scroll', scrollEvent);
      set(this, 'scrollEvent', null);
    }

    let resizeEvent = this.resizeEvent;

    if(resizeEvent) {
      window.removeEventListener('resize', resizeEvent);
      set(this, 'resizeEvent', null);
    }
  },

  requestTick() {
      if (!this.ticking) {
          requestAnimationFrame(() => {
            this.update();
          });
      }
      set(this, 'ticking', true);
  },

  update() {
    // debugger
    var title = document.querySelector('.post-full-title');
    var lastScrollY = this.lastScrollY;

    var trigger = title.getBoundingClientRect().top + window.scrollY;
    var triggerOffset = title.offsetHeight + 35;
    var progressMax = this.lastDocumentHeight - this.lastWindowHeight;

    // show/hide floating header
    if (lastScrollY >= trigger + triggerOffset) {
        set(this, 'floating', true);
    } else {
        set(this, 'floating', false);
    }

    set(this, 'max', progressMax);
    set(this, 'value', this.lastScrollY);

    set(this, 'ticking', false);
  },

  tagName: '',
  layout
});
