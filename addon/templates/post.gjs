import RouteTemplate from 'ember-route-template';

import { LinkTo } from '@ember/routing';
import date from 'empress-blog-ghost-helpers/helpers/date';
import markdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import plural from 'empress-blog-ghost-helpers/helpers/plural';
import SiteNav from '../components/site-nav';
import ResponsiveImage from 'ember-responsive-image/components/responsive-image';
import BylineMultiple from '../components/byline-multiple';
import BylineSingle from '../components/byline-single';
import PostCard from '../components/post-card';
import FloatingHeader from '../components/floating-header';
import gt from 'empress-blog-ghost-helpers/helpers/gt';
import { take } from '@nullvoxpopuli/ember-composable-helpers';

export default RouteTemplate(
  <template>
    {{! template-lint-disable no-array-prototype-extensions no-curly-component-invocation no-duplicate-landmark-elements no-link-to-positional-params }}
    {{!< default}}

    {{! The tag above means: insert everything in this file
into the {body} of the default.hbs template }}

    <header class="site-header outer">
      <div class="inner">
        <SiteNav />
      </div>
    </header>

    {{#let @model.post as |post|}}

      <main id="site-main" class="site-main outer">
        <div class="inner">

          <article class="post-full {{unless post.image 'no-image'}}">

            <header class="post-full-header">
              <section class="post-full-meta">
                <time
                  class="post-full-meta-date"
                  datetime="{{date post format="YYYY-MM-DD"}}"
                >
                  {{date post format="D MMMM YYYY"}}
                </time>
                {{#if post.primaryTag}}
                  <span class="date-divider">/</span>
                  <LinkTo @route="tag" @model={{post.primaryTag}}>
                    {{if
                      post.primaryTag.name
                      post.primaryTag.name
                      post.primaryTag
                    }}
                  </LinkTo>
                {{/if}}
              </section>
              <h1 class="post-full-title">{{post.title}}</h1>
            </header>

            {{#if post.image}}
              <figure class="post-full-image">
                <ResponsiveImage @src={{post.image}} />
              </figure>
            {{/if}}

            <section class="post-full-content">
              <div class="post-content">
                {{markdownToHtml post.content tagName=""}}
              </div>
            </section>

            {{! Email subscribe form at the bottom of the page }}
            {{! TODO add subscribe form back in }}
            {{!-- {{#if @labs.subscribers}}
            <section class="subscribe-form">
                <h3 class="subscribe-form-title">Subscribe to {{@site.title}}</h3>
                <p>Get the latest posts delivered right to your inbox</p>
                {{subscribe_form placeholder="youremail@example.com"}}
            </section>
            {{/if}} --}}

            <footer class="post-full-footer">

              {{! There are two options for how we display the byline/author-info.
                If the post has more than one author, we load a specific template
                from includes/byline-multiple.hbs, otherwise, we just use the
                default byline. }}

              {{#if (gt post.authors.length 1)}}
                <BylineMultiple @authors={{post.authors}} />
              {{else}}
                <BylineSingle @author={{post.authors.firstObject}} />
              {{/if}}

            </footer>

            {{!
            <section class="post-full-comments">
                If you want to embed comments, this is a good place to do it!
            </section>
            }}

          </article>

        </div>
      </main>

      {{! Links to Previous/Next posts }}
      <aside class="read-next outer">
        <div class="inner">
          <div class="read-next-feed">
            {{#if post.primaryTag}}
              {{#if @controller.relatedPosts}}
                <article
                  class="read-next-card"
                  style={{@controller.tagBackgroundImageStyle}}
                >
                  <header class="read-next-card-header">
                    <small class="read-next-card-header-sitetitle">&mdash;
                      {{@controller.blog.title}}
                      &mdash;</small>

                    <h3 class="read-next-card-header-title"><LinkTo
                        @route="tag"
                        @model={{@model.post.primaryTag}}
                      >{{if
                          post.primaryTag.name
                          post.primaryTag.name
                          post.primaryTag
                        }}</LinkTo></h3>

                  </header>
                  {{! <div class="read-next-divider"><SvgIcons::Infinity /></div> }}
                  <div class="read-next-card-content">
                    <ul>
                      {{#each (take 3 @controller.relatedPosts) as |post|}}
                        <li><LinkTo
                            @route="post"
                            @model={{post.id}}
                          >{{post.title}}</LinkTo></li>
                      {{/each}}
                    </ul>
                  </div>
                  <footer class="read-next-card-footer">
                    <LinkTo
                      @route="tag"
                      @model={{@model.post.primaryTag}}
                    >{{plural
                        @controller.relatedPosts.length
                        empty="No posts"
                        singular="% post"
                        plural="See all % posts"
                      }}
                      →</LinkTo>
                  </footer>
                </article>
              {{/if}}
            {{/if}}

            {{! If there's a next post, display it using the same markup included from - partials/post-card.hbs }}
            {{#if @controller.nextPost}}
              <PostCard @post={{@controller.nextPost}} />
            {{/if}}

            {{! If there's a previous post, display it using the same markup included from - partials/post-card.hbs }}
            {{#if @controller.prevPost}}
              <PostCard @post={{@controller.prevPost}} />
            {{/if}}

          </div>
        </div>
      </aside>

      <FloatingHeader @post={{@model.post}} />

    {{/let}}
  </template>,
);
