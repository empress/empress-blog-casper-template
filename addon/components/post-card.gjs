import Component from '@glimmer/component';
import { inject as service } from '@ember/service';
import { LinkTo } from '@ember/routing';
import ResponsiveImage from 'ember-responsive-image/components/responsive-image';
import Avatar from './svg-icons/avatar';

import excerpt from '../helpers/excerpt';
import readingTime from 'empress-blog-ghost-helpers/helpers/reading-time';
import has from 'empress-blog-ghost-helpers/helpers/has';
import and from 'ember-truth-helpers/helpers/and';

export default class PostCard extends Component {
  @service router;

  get isHome() {
    return this.router.currentRouteName === 'index';
  }

  <template>
    <article
      class="post-card
        {{unless @post.image 'no-image'}}
        {{if (and this.isHome (has @index index="nth:6")) 'post-card-large'}}"
    >

      {{#if @post.image}}
        <LinkTo @route="post" @model={{@post.id}} class="post-card-image-link">
          <ResponsiveImage class="post-card-image" @src={{@post.image}} />
        </LinkTo>
      {{/if}}

      <div class="post-card-content">

        <LinkTo
          @route="post"
          @model={{@post.id}}
          class="post-card-content-link"
        >

          <header class="post-card-header">
            {{#if @post.primaryTag}}
              <span class="post-card-tags">
                {{if
                  @post.primaryTag.name
                  @post.primaryTag.name
                  @post.primaryTag
                }}
              </span>
            {{/if}}
            <h2 class="post-card-title">{{@post.title}}</h2>
          </header>

          <section class="post-card-excerpt">
            <p>{{excerpt @post.html words="33"}}</p>
          </section>

        </LinkTo>

        <footer class="post-card-meta">

          <ul class="author-list">
            {{#each @post.authors as |author|}}
              <li class="author-list-item">

                <div class="author-name-tooltip">
                  {{author.name}}
                </div>

                {{#if author.image}}
                  <LinkTo
                    @route="author"
                    @model={{author.id}}
                    class="static-avatar"
                  >
                    <img
                      class="author-profile-image"
                      src={{author.image}}
                      alt={{author.name}}
                    />
                  </LinkTo>
                {{else}}
                  <LinkTo
                    @route="author"
                    @model={{author.id}}
                    class="static-avatar author-profile-image"
                  >
                    <Avatar />
                  </LinkTo>
                {{/if}}
              </li>
            {{/each}}
          </ul>

          <span class="reading-time">{{readingTime @post}}</span>

        </footer>

      </div>{{!/.post-card-content}}
    </article>
  </template>
}
