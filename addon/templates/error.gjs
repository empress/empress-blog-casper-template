import RouteTemplate from 'ember-route-template';
import { LinkTo } from '@ember/routing';
import Header from '../components/header';
import Component from '@glimmer/component';
import { inject as service } from '@ember/service';

// import PostCard from '../components/post-card';
// import get from '@nullvoxpopuli/ember-composible-helpers';

class ErrorRouteComponent extends Component {
  @service blog;

  get error() {
    return this.args.model?.errors?.[0] ?? this.args.model;
  }

  <template>
    {{! template-lint-disable no-curly-component-invocation no-implicit-this no-link-to-positional-params no-log }}
    <div class="site-wrapper">

      <Header @background={{this.blog.coverImage}}>
        <div class="inner">
          <nav class="site-nav-center">
            {{#if this.blog.logo}}
              <LinkTo @route="index" class="site-nav-logo">
                <img src={{this.blog.logo}} alt={{this.blog.title}} />
              </LinkTo>
            {{else}}
              <LinkTo @route="index" class="site-nav-logo">
                {{this.blog.title}}
              </LinkTo>
            {{/if}}
          </nav>
        </div>
      </Header>

      <main id="site-main" class="site-main outer">
        <div class="inner">

          <section class="error-message">
            <h1 class="error-code">{{this.error.status}}</h1>
            <p class="error-description">{{this.error.title}}</p>
            <LinkTo @route="index" class="error-link">Go to the front page →</LinkTo>
          </section>
        </div>
      </main>

      {{! TODO recreate the error behaviour of ghost }}
      {{!-- {{#get "posts" limit="3"}}
        <aside class="outer">
            <div class="inner">
                <div class="post-feed">
                    {{#each posts as |post|}}
                        <PostCard @post={{post}} />
                    {{/each}}
                </div>
            </div>
        </aside>
      {{/get}} --}}

    </div>
  </template>
}

export default RouteTemplate(ErrorRouteComponent);
