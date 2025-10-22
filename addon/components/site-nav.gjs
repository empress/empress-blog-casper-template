import Component from '@ember/component';
import { inject as service } from '@ember/service';
import { LinkTo } from '@ember/routing';
import NavigationLinks from './navigation-links';
import Facebook from './svg-icons/facebook';
import Twitter from './svg-icons/twitter';
import Rss from './svg-icons/rss';

export default class SiteNav extends Component {
  @service blog;
  @service router;

  get isHome() {
    return this.router.currentRouteName === 'index';
  }

  get rssFeed() {
    return `https://feedly.com/i/subscription/feed${encodeURIComponent(`/${this.blog.host}/rss.xml`)}`;
  }

  <template>
    <nav class="site-nav">
      <div class="site-nav-left">
        {{#unless this.isHome}}
          {{#if this.blog.logo}}
            <LinkTo @route="index" class="site-nav-logo">
              <img src={{this.blog.logo}} alt={{this.blog.title}} />
            </LinkTo>
          {{else}}
            <LinkTo @route="index" class="site-nav-logo">
              {{this.blog.title}}
            </LinkTo>
          {{/if}}
        {{/unless}}
        {{#if this.blog.navigation}}
          <NavigationLinks />
        {{/if}}
      </div>
      <div class="site-nav-right">
        <div class="social-links">
          {{#if this.blog.facebook}}
            <a
              class="social-link social-link-fb"
              href="https://www.facebook.com/{{this.blog.facebook}}"
              title="Facebook"
              target="_blank"
              rel="noopener"
            >
              <Facebook />
            </a>
          {{/if}}
          {{#if this.blog.twitter}}
            <a
              class="social-link social-link-tw"
              href="https://twitter.com/{{this.blog.twitter}}"
              title="Twitter"
              target="_blank"
              rel="noopener"
            >
              <Twitter />
            </a>
          {{/if}}
        </div>
        {{#if @labs.subscribers}}
          <a class="subscribe-button" href="#subscribe">Subscribe</a>
        {{else if this.blog.host}}
          <a
            class="rss-button"
            href={{this.rssFeed}}
            target="_blank"
            rel="noopener"
          >
            <Rss />
          </a>
        {{/if}}
      </div>
    </nav>
  </template>
}
