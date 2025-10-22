import RouteTemplate from 'ember-route-template';
import { LinkTo } from '@ember/routing';

import Header from '../components/header';
import SiteNav from '../components/site-nav';
import PostCard from '../components/post-card';
import { sortBy } from '@nullvoxpopuli/ember-composable-helpers';

export default RouteTemplate(
  <template>
    {{! template-lint-disable no-curly-component-invocation }}
    {{!< default}}
    {{! The tag above means: insert everything in this file
into the {body} of the default.hbs template }}

    <Header @background={{@controller.blog.coverImage}}>
      {{!Special header.hbs partial to generate the <header> tag}}
      <div class="inner">
        <div class="site-header-content">
          <h1 class="site-title">
            {{#if @controller.blog.logo}}
              <img
                class="site-logo"
                src={{@controller.blog.logo}}
                alt={{@controller.blog.title}}
              />
            {{else}}
              {{@controller.blog.title}}
            {{/if}}
          </h1>
          <h2 class="site-description">{{@controller.blog.description}}</h2>
        </div>
        <SiteNav />
      </div>
    </Header>

    {{! The main content area }}
    <main id="site-main" class="site-main outer">
      <div class="inner">

        <div class="post-feed">
          {{#each (sortBy "date:desc" @model) as |post index|}}

            {{! The tag below includes the markup for each post - partials/post-card.hbs }}
            <PostCard @index={{index}} @post={{post}} />

          {{/each}}
        </div>

      </div>
    </main>
  </template>,
);
