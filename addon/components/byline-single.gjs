import Avatar from './svg-icons/avatar';
import { LinkTo } from '@ember/routing';

<template>
  <section class="author-card">
    {{#if @author.image}}
      <img
        class="author-profile-image"
        src={{@author.image}}
        alt={{@author.name}}
      />
    {{else}}
      <span class="avatar-wrapper"><Avatar /></span>
    {{/if}}
    <section class="author-card-content">
      <h4 class="author-card-name">
        <LinkTo @route="author" @model={{@author.id}}>
          {{@author.name}}
        </LinkTo>
      </h4>
      {{#if @author.content}}
        <p>{{@author.content}}</p>
      {{else}}
        <p>
          Read
          <LinkTo @route="author" @model={{@author.id}}>more posts</LinkTo>
          by this author.
        </p>
      {{/if}}
    </section>
  </section>
  <div class="post-full-footer-right">
    <LinkTo @route="author" @model={{@author.id}} class="author-card-button">
      Read More
    </LinkTo>
  </div>
</template>
