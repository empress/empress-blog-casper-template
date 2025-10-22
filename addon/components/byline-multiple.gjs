import Avatar from './svg-icons/avatar';
import { LinkTo } from '@ember/routing';

<template>
  <section class="post-full-authors">

    <div class="post-full-authors-content">
      <p>This post was a collaboration between</p>
    </div>

    <ul class="author-list">
      {{#each @authors as |author|}}
        <li class="author-list-item">

          <div class="author-card">
            <div class="basic-info">
              {{#if author.image}}
                <img
                  class="author-profile-image"
                  src={{author.image}}
                  alt={{author.name}}
                />
              {{else}}
                <div class="author-profile-image"><Avatar /></div>
              {{/if}}
              <h2>{{author.name}}</h2>
            </div>
            <div class="bio">
              {{#if author.content}}
                <p>{{author.content}}</p>
                <p>
                  <LinkTo @route="author" @model={{author.id}}>More posts</LinkTo>
                  by
                  {{author.name}}.
                </p>
              {{else}}
                <p>
                  Read
                  <LinkTo @route="author" @model={{author.id}}>more posts</LinkTo>
                  by this author.
                </p>
              {{/if}}
            </div>
          </div>

          {{#if author.image}}
            <LinkTo @route="author" @model={{author.id}} class="moving-avatar">
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
              class="moving-avatar author-profile-image"
            >
              <Avatar />
            </LinkTo>
          {{/if}}

        </li>
      {{/each}}
    </ul>

  </section>
</template>
