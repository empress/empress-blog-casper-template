import RouteTemplate from 'ember-route-template';

import Header from '../components/header';
import SiteNav from '../components/site-nav';
import PostCard from '../components/post-card';
import { sortBy } from '@nullvoxpopuli/ember-composable-helpers';
import MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import plural from 'empress-blog-ghost-helpers/helpers/plural';

export default RouteTemplate(
  <template>
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
          <h1 class="site-title">{{if @model.name @model.name @model.tag}}</h1>
          <h2 class="site-description">
            {{#if @model.content}}
              <MarkdownToHtml @markdown={{@model.content}} />
            {{else}}
              A collection of
              {{plural
                @model.posts.length
                empty="posts"
                singular="% post"
                plural="% posts"
              }}
            {{/if}}
          </h2>
        </div>
      </div>
    </Header>

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
