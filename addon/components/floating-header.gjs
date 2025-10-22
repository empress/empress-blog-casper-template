import Component from '@glimmer/component';
import { inject as service } from '@ember/service';
import { tracked } from '@glimmer/tracking';
import { LinkTo } from '@ember/routing';

import Facebook from './svg-icons/facebook';
import Twitter from './svg-icons/twitter';
import Point from './svg-icons/point';

import encode from 'empress-blog-ghost-helpers/helpers/encode';

import { modifier } from 'ember-modifier';

const scrollModifier = modifier((element, [component]) => {
  let scrollEvent = () => {
    component.lastScrollY = window.scrollY;
    component.requestTick();
  };

  window.addEventListener('scroll', scrollEvent, { passive: true });

  let resizeEvent = () => {
    component.lastWindowHeight = window.innerHeight;
    component.lastDocumentHeight = document.body.scrollHeight;
    component.requestTick();
  };

  window.addEventListener('resize', resizeEvent, false);

  return () => {
    window.removeEventListener('scroll', scrollEvent);
    window.removeEventListener('resize', resizeEvent);
  };
});

export default class FloatingHeaderComponent extends Component {
  <template>
    <div
      class="floating-header {{if this.floating 'floating-active'}}"
      {{scrollModifier this}}
    >
      <div class="floating-header-logo">
        <LinkTo @route="index">
          {{#if this.blog.icon}}
            <img src="{{this.blog.icon}}" alt="{{this.blog.title}} icon" />
          {{/if}}
          <span>
            {{this.blog.title}}
          </span>
        </LinkTo>
      </div>
      <span class="floating-header-divider">&mdash;</span>
      <div class="floating-header-title">{{@post.title}}</div>
      <div class="floating-header-share">
        <div class="floating-header-share-label">Share this <Point /></div>
        <a
          class="floating-header-share-tw"
          href="https://twitter.com/share?text={{encode
            @post.title
          }}&amp;url={{encode this.location}}"
          onclick="window.open(this.href, 'share-twitter', 'width=550,height=235');return false;"
        >
          <Twitter />
        </a>
        <a
          class="floating-header-share-fb"
          href="https://www.facebook.com/sharer/sharer.php?u={{encode
            this.location
          }}"
          onclick="window.open(this.href, 'share-facebook','width=580,height=296');return false;"
        >
          <Facebook />
        </a>
      </div>
      <progress
        id="reading-progress"
        class="progress"
        value={{this.value}}
        max={{this.max}}
      >
        <div class="progress-container">
          <span class="progress-bar"></span>
        </div>
      </progress>
    </div>
  </template>

  @service blog;
  @service fastboot;
  @tracked value = 0;
  @tracked max;

  @tracked lastScrollY;
  @tracked lastWindowHeight;
  @tracked lastDocumentHeight;
  @tracked ticking;
  @tracked floating;

  constructor() {
    super(...arguments);

    if (this.fastboot.isFastBoot) {
      return;
    }

    this.lastScrollY = window.scrollY;
    this.lastWindowHeight = window.innerHeight;
    this.lastDocumentHeight = document.body.scrollHeight;

    this.update();
  }

  get location() {
    return window.location;
  }

  requestTick() {
    if (!this.ticking) {
      requestAnimationFrame(() => {
        this.update();
      });
    }
    this.ticking = true;
  }

  update() {
    var title = document.querySelector('.post-full-title');
    var lastScrollY = this.lastScrollY;

    var trigger = title.getBoundingClientRect().top + window.scrollY;
    var triggerOffset = title.offsetHeight + 35;
    var progressMax = this.lastDocumentHeight - this.lastWindowHeight;

    // show/hide floating header
    if (lastScrollY >= trigger + triggerOffset) {
      this.floating = true;
    } else {
      this.floating = false;
    }

    this.max = progressMax;
    this.value = this.lastScrollY;

    this.ticking = false;
  }
}
