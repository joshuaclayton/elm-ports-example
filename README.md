# Elm Ports Example

This is an Elm application demonstrating ports usage with Elm's
`Json.Decode`, `Json.Encode`, and Google Maps.

## Installation

```sh
$ git clone https://github.com/joshuaclayton/elm-ports-example
$ cd elm-ports-example
```

First, ensure [Yarn is installed], then:

```sh
$ yarn
```

[Yarn is installed]: https://yarnpkg.com/lang/en/docs/install/

## Run the Application

```sh
$ npm start
```

Then, visit http://localhost:8080/

## Deploy

Deploying to [Heroku] requires two [buildpacks]:

[Heroku]: https://www.heroku.com/
[buildpacks]: https://devcenter.heroku.com/articles/buildpacks

```
1. heroku/nodejs
2. https://github.com/heroku/heroku-buildpack-static.git
```

This will compile the Elm application to the `dist/` directory with the Node
buildpack, and then serve the site up statically.

When you deploy to Heroku, you'll also want to configure the
`GOOGLE_MAPS_API_KEY` environment variable to ensure the map is displayed
correctly.

## License

elm-ports-example is Copyright ©2017 Josh Clayton and thoughtbot, inc. It
is free software, and may be redistributed under the terms specified in the
[LICENSE](/LICENSE) file.

## About thoughtbot

![thoughtbot](http://presskit.thoughtbot.com/images/thoughtbot-logo-for-readmes.svg)

We love open source software!  See [our other projects][community] or [hire
us][hire] to design, develop, and grow your product.

[community]: https://thoughtbot.com/community?utm_source=github
[hire]: https://thoughtbot.com?utm_source=github
