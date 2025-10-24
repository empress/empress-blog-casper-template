# Changelog

## Release (2025-10-24)

* empress-blog-casper-template 5.0.4 (patch)

#### :bug: Bug Fix
* `empress-blog-casper-template`
  * [#74](https://github.com/empress/empress-blog-casper-template/pull/74) make author reference work for old ember-data ([@mansona](https://github.com/mansona))

#### :house: Internal
* `empress-blog-casper-template`
  * [#76](https://github.com/empress/empress-blog-casper-template/pull/76) update empress-blog ([@mansona](https://github.com/mansona))

#### Committers: 1
- Chris Manson ([@mansona](https://github.com/mansona))

## Release (2025-10-23)

* empress-blog-casper-template 5.0.3 (patch)

#### :bug: Bug Fix
* `empress-blog-casper-template`
  * [#72](https://github.com/empress/empress-blog-casper-template/pull/72) add ember-cli-showdown dependency ([@mansona](https://github.com/mansona))

#### Committers: 1
- Chris Manson ([@mansona](https://github.com/mansona))

## Release (2025-10-23)

* empress-blog-casper-template 5.0.2 (patch)

#### :house: Internal
* `empress-blog-casper-template`
  * [#70](https://github.com/empress/empress-blog-casper-template/pull/70) inline excerpt helper stop defining empress-blog peer ([@mansona](https://github.com/mansona))

#### Committers: 1
- Chris Manson ([@mansona](https://github.com/mansona))

## Release (2025-10-22)

* empress-blog-casper-template 5.0.1 (patch)

#### :bug: Bug Fix
* `empress-blog-casper-template`
  * [#68](https://github.com/empress/empress-blog-casper-template/pull/68) add missing peer for empress-blog ([@mansona](https://github.com/mansona))

#### Committers: 1
- Chris Manson ([@mansona](https://github.com/mansona))

## Release (2025-10-22)

* empress-blog-casper-template 5.0.0 (major)

#### :boom: Breaking Change
* `empress-blog-casper-template`
  * [#63](https://github.com/empress/empress-blog-casper-template/pull/63) drop support for ember < 3.28 ([@mansona](https://github.com/mansona))
  * [#58](https://github.com/empress/empress-blog-casper-template/pull/58) drop support for node < 20 and swap to pnpm ([@mansona](https://github.com/mansona))
  * [#57](https://github.com/empress/empress-blog-casper-template/pull/57) Breaking: Drop support for Node < 16 ([@NullVoxPopuli](https://github.com/NullVoxPopuli))

#### :rocket: Enhancement
* `empress-blog-casper-template`
  * [#64](https://github.com/empress/empress-blog-casper-template/pull/64) Convert everything to GJS ([@mansona](https://github.com/mansona))

#### :bug: Bug Fix
* `empress-blog-casper-template`
  * [#65](https://github.com/empress/empress-blog-casper-template/pull/65) use latest node lts for release ([@mansona](https://github.com/mansona))

#### :house: Internal
* `empress-blog-casper-template`
  * [#60](https://github.com/empress/empress-blog-casper-template/pull/60) Prepare Release v5.0.0 ([@github-actions[bot]](https://github.com/apps/github-actions))
  * [#62](https://github.com/empress/empress-blog-casper-template/pull/62) update to v5.12.0 with ember-cli-update ([@mansona](https://github.com/mansona))
  * [#61](https://github.com/empress/empress-blog-casper-template/pull/61) update to v4.12 with ember-cli-update ([@mansona](https://github.com/mansona))
  * [#59](https://github.com/empress/empress-blog-casper-template/pull/59) start using release-plan ([@mansona](https://github.com/mansona))

#### Committers: 3
- Chris Manson ([@mansona](https://github.com/mansona))
- [@NullVoxPopuli](https://github.com/NullVoxPopuli)
- [@github-actions[bot]](https://github.com/apps/github-actions)

4.3.0 / 2021-12-06
==================

  * remove {{link-to}} calls using positional arguments #50 from @mansona

4.2.0 / 2021-11-23
==================

  * Update with ember-cli-update and remove deprecations #49 from @mansona

4.1.0 / 2021-11-23
==================

  * Fix most deprecations and add ember-try test for no-deprecations #47 from @mansona

4.0.3 / 2021-09-20
==================

  * Bump empress-blog-ghost-helpers #48 from @elwayman02

4.0.2 / 2021-09-19
==================

  * Bump ember-responsive-image #46 from @elwayman02

4.0.1 / 2021-08-25
==================

  * fix responsive-image config passthrough #45 from @mansona

4.0.0 / 2021-08-25
==================

  * breaking: update with ember-cli-update and drop support for old Ember versions #44 from @mansona
  * breaking: Move responsive image to dependencies #37 from @mansona
  * Move to GitHub actions #43 from @mansona


3.3.0 / 2020-08-13
==================

  * use empress-blog-ghost-helpers instead of shipping custom helpers #33 from @nickschot

3.2.1 / 2020-07-13
==================

  * start using empress-blueprint-helpers for config editing #31 from @mansona

3.2.0 / 2020-06-04
==================

  * Update dependencies #26 #30 from @mansona

3.1.0 / 2019-05-07
==================

  * Resync with upstream
  * General Updates #25 from @mansona
  * Make tags a first class citizen #21 from @mansona
  * Fix multi-byline #24 from @happycollision

3.0.4 / 2019-04-16
==================

  * resync with 'upstream/master'
  * remove wrapping div from markdown
  * allow ember-meta to work from empress-blog
  * fix multiple author byline

3.0.3 / 2019-03-12
==================

* adding ember-responsive-image config to host app
* Revert "moving responsive-image to dependencies"

3.0.2 / 2019-03-12
==================  

* moving responsive-image to dependencies

3.0.1 / 2019-03-12
==================

* fixing deployment

3.0.0 / 2019-03-12
==================

* resyncing with upstream  #18 from @mansona

2.0.5 / 2019-03-12
==================

  * changing Ember Ghost to empress-blog #17 from @mansona
