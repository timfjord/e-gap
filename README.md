# Simple Pages API

## URL's

* [http://cryptic-escarpment-9434.herokuapp.com/api/pages](http://cryptic-escarpment-9434.herokuapp.com/api/pages)
* [http://cryptic-escarpment-9434.herokuapp.com/api/pages/publushed](http://cryptic-escarpment-9434.herokuapp.com/api/pages/publushed)
* [http://cryptic-escarpment-9434.herokuapp.com/api/pages/unpublushed](http://cryptic-escarpment-9434.herokuapp.com/api/pages/unpublushed)

By default server return json response. To get xml use http://cryptic-escarpment-9434.herokuapp.com/api/pages.xml

## Usage

    $ git clone git@github.com:timsly/e-gap.git
    $ cd e-gap
    $ bundle exec rake db:create && bundle exec rake db:migrate
    $ bundle exec rails s
    
Go to [localhost:3000](http://localhost:3000)

Make sure you have postgres installed with `timsly` user.

## Test unit

    $ bundle exec rake db:test:prepare

To run rspec

    $ bundle exec rspec

To run cucumber features

    $ bundle exec cucumber
    
## TODO

Add features to cover xml format

