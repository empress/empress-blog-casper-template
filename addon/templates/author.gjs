import RouteTemplate from 'ember-route-template';

import Header from '../components/header';
import SiteNav from '../components/site-nav';
import PostCard from '../components/post-card';
import markdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import plural from 'empress-blog-ghost-helpers/helpers/plural';
import { sortBy } from '@nullvoxpopuli/ember-composable-helpers';
import Website from '../components/svg-icons/website';
import Twitter from '../components/svg-icons/twitter';
import Facebook from '../components/svg-icons/facebook';

export default RouteTemplate(
  <template>
    {{! template-lint-disable link-rel-noopener no-curly-component-invocation }}
    {{!< default}}
    {{! The tag above means - insert everything in this file into the {body} of the default.hbs template }}

    {{#let @model as |author|}}
      {{! Everything inside the #author tags pulls data from the author }}

      <Header
        @background={{if
          @controller.coverImage
          @controller.coverImage
          @controller.blog.coverImage
        }}
      >
        <div class="inner">
          <SiteNav />
          <div class="site-header-content">
            {{#if author.image}}
              <img
                class="author-profile-image"
                src={{author.image}}
                alt="{{author.name}}"
              />
            {{/if}}
            <h1 class="site-title">{{author.name}}</h1>
            {{#if author.content}}
              <h2 class="author-bio">
                {{markdownToHtml author.content tagName=""}}
              </h2>
            {{/if}}
            <div class="author-meta">
              {{#if author.location}}
                <div class="author-location">
                  {{author.location}}
                  <span class="bull">&bull;</span>
                </div>
              {{/if}}
              <div class="author-stats">
                {{plural
                  author.posts.length
                  empty="No posts"
                  singular="% post"
                  plural="% posts"
                }}
                <span class="bull">&bull;</span>
              </div>
              {{#if author.website}}
                <a
                  class="social-link social-link-wb"
                  href={{author.website}}
                  target="_blank"
                  rel="noopener"
                >
                  <Website />
                </a>
              {{/if}}
              {{#if author.twitter}}
                <a
                  class="social-link social-link-tw"
                  href="https://twitter.com/{{author.twitter}}"
                  target="_blank"
                  rel="noopener"
                >
                  <Twitter />
                </a>
              {{/if}}
              {{#if author.facebook}}
                <a
                  class="social-link social-link-fb"
                  href="https://www.facebook.com/{{author.facebook}}"
                  target="_blank"
                  rel="noopener"
                >
                  <Facebook />
                </a>
              {{/if}}
              {{!-- <a class="social-link social-link-rss" href="https://feedly.com/i/subscription/feed/{{url absolute="true"}}rss/" target="_blank" rel="noopener"><Rss /></a> --}}
            </div>
          </div>
        </div>
      </Header>
    {{/let}}

    {{! The main content area }}
    <main id="site-main" class="site-main outer">
      <div class="inner">

        <div class="post-feed">
          {{#each (sortBy "date:desc" @model.posts) as |post|}}

            {{! The tag below includes the markup for each post - partials/post-card.hbs }}
            <PostCard @post={{post}} />

          {{/each}}
        </div>

      </div>
    </main>
  </template>,
);
