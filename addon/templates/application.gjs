import RouteTemplate from 'ember-route-template';

import HeadLayout from 'ember-cli-head/components/head-layout';
import { LinkTo } from '@ember/routing';
import date from 'empress-blog-ghost-helpers/helpers/date';

export default RouteTemplate(
  <template>
    {{! template-lint-disable link-rel-noopener no-curly-component-invocation no-forbidden-elements no-invalid-link-text no-link-to-positional-params }}
    <HeadLayout />

    {{! Indententation is intentional to reduce diff from upstream }}
    <div class="site-wrapper">

      {{! All the main content gets inserted here, index.hbs, post.hbs, etc }}
      {{outlet}}

      {{! The footer at the very bottom of the screen }}
      <footer class="site-footer outer">
        <div class="site-footer-content inner">
          <section class="copyright">
            <a href={{@controller.blog.url}}>
              {{@controller.blog.title}}
            </a>
            &copy;
            {{date format="YYYY"}}
          </section>
          <nav class="site-footer-nav">
            <LinkTo @route="index">Latest Posts</LinkTo>
            {{#if @controller.blog.facebook}}
              <a
                href="https://facebook.com/{{@controller.blog.facebook}}"
                target="_blank"
                rel="noopener"
              >
                Facebook
              </a>
            {{/if}}
            {{#if @controller.blog.twitter}}
              <a
                href="https://twitter.com/{{@controller.blog.twitter}}"
                target="_blank"
                rel="noopener"
              >
                Twitter
              </a>
            {{/if}}
            <a
              href="https://github.com/empress/empress-blog-casper-template"
              target="_blank"
              rel="noopener"
            >
              empress-blog Casper Template
            </a>
          </nav>
        </div>
      </footer>

    </div>

    {{! The big email subscribe modal content }}
    {{! TODO add the subscribe back in }}
    {{!-- {{#if @labs.subscribers}}
      <div id="subscribe" class="subscribe-overlay">
          <a class="subscribe-overlay-close" href="#"></a>
          <div class="subscribe-overlay-content">
              {{#if @site.logo}}
                  <img class="subscribe-overlay-logo" src="{{@site.logo}}" alt="{{@site.title}}" />
              {{/if}}
              <h1 class="subscribe-overlay-title">Subscribe to {{@site.title}}</h1>
              <p class="subscribe-overlay-description">Stay up to date! Get all the latest &amp; greatest posts delivered straight to your inbox</p>
              {{subscribe_form placeholder="youremail@example.com"}}
          </div>
      </div>
      {{/if}} --}}

    {{!--
      {{#if pagination.pages}}
      <script src="{{asset "built/infinitescroll.js"}}"></script>
      {{/if}}
      --}}
  </template>,
);
