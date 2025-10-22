import Component from '@glimmer/component';
import { inject as service } from '@ember/service';

import { LinkTo } from '@ember/routing';

export default class NavigationLinks extends Component {
  @service blog;

  <template>
    {{! template-lint-disable no-nested-interactive }}
    <ul class="nav" role="menu">
      {{#each this.blog.navigation as |navigation|}}
        <li class="nav-{{navigation.label}}" role="menuitem">
          {{#if navigation.id}}
            <LinkTo @route={{navigation.route}} @model={{navigation.id}}>
              {{navigation.label}}
            </LinkTo>
          {{else if navigation.route}}
            <LinkTo @route={{navigation.route}}>
              {{navigation.label}}
            </LinkTo>
          {{else if navigation.link}}
            <a href="{{navigation.link}}">
              {{navigation.label}}
            </a>
          {{/if}}
        </li>
      {{/each}}
    </ul>
  </template>
}
