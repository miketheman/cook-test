cook-test
=========
[![Build Status](https://secure.travis-ci.org/miketheman/cook-test.png?branch=master)](http://travis-ci.org/miketheman/cook-test)
[![Dependency Status](https://gemnasium.com/miketheman/cook-test.png)](https://gemnasium.com/miketheman/cook-test)

This is a place to test cookbook testing integrations

Tests
-----
* `tailor` - checks for preferred ruby styling. Initial guard against malformed ruby
* `foodcritic` - lints style, correctness
* `knife cookbook test` - checks correct syntax for a cookbook

Supplemental tools
------------------

* guard - run unit tests during development
* travis-ci - run integration tests post-commit

Flow
----

* Fork/clone repo
* Install development dependencies:

        bundle install
* Download any dependencies, run all tests:

        rake berks
        rake
* Start up `guard`:

        bundle exec guard start
    `guard` will execute `foodcritic` and `chefspec` tests as files are saved.
* Checkout a Feature branch, name it well!

        git checkout -b <featurename>
* Make changes
* Commit, issue pull request
* Beer!


Assumptions
-----------
Travis should not be checking style - that's part of development

Running unit tests against any cookbook that has dependencies (which many do) requires those dependencies to be available at test run time.
Since Guard will watch files for changes, this means that getting the dependencies in place is crucial.

Berkshelf will place install shims into `./cookbooks` and then Guard will watch `<repo root>/cookbooks/<cookbook name>/[spec|any ruby file]`.
