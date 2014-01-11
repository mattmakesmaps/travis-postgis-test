travis-postgis-test
===================

[![Build Status](https://travis-ci.org/mattmakesmaps/travis-postgis-test.png?branch=master)](https://travis-ci.org/mattmakesmaps/travis-postgis-test)

# Overview

Provide an example configuration demonstrating the creation of a PostGIS-enabled database
via Travis CI.

- `.travis.yml`: The example Travis CI configuration file.
- `test_data.sql`: Test geometries to be loaded into a testing DB by Travis CI.
- `test_example.py`: Unit test example utilizing PostGIS DB created by Travis CI.

Full notes can on this [blog](http://mattmakesmaps.com/blog/2014/01/11/configure-postgis-with-travis-ci/).
