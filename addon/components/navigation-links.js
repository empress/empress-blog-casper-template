/* eslint-disable ember/no-classic-components, ember/no-classic-classes, prettier/prettier */
import Component from '@ember/component';
import { inject as service } from '@ember/service';
import layout from '../templates/components/navigation-links';

export default Component.extend({
  blog: service(),
  tagName: '',
  layout
});
