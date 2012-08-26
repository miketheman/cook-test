cook-test
=========

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

1. Fork/clone repo
1. Execute `bundle install`
1. Execute `rake` to run all default tests
1. Checkout a Feature branch, name it well! `git checkout -b <featurename>`

1. Start guard to watch for changes on saves

1. Make changes

1. Test style with `rake tailor`

1. Commit, issue pull request
1. Beer!


Assumptions
-----------
Travis should not be checking style - that's part of development
