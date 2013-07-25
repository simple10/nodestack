NodeStack
=======

Starter node stack for Rails developers. All the benefits of the Rails asset pipeline
and predictable code layout without all the hidden magic.

### Features

* [Express](http://expressjs.com/) - web server
* [Connect Assets](https://github.com/adunkman/connect-assets) - asset pipeline
* [CoffeeScript](http://coffeescript.org/) - better JavaScript
* [Jade](http://jade-lang.com/) - better HAML
* [Stylus](http://learnboost.github.io/stylus/) - better SASS
* [Nib](https://github.com/visionmedia/nib) - stylus mixins
* [Foundation](http://foundation.zurb.com/) - front-end framework

### Non-features

* ORM/ActiveRecord - add your ORM of choice as needed
* Pretty much anything else not explicitly mentioned in features

The goal of NodeStack is to be as minimal as possible to reduce the clutter and learning
curve while maximizing performance and memory footprint.


# Installation

Node.js and npm must already be installed.

```bash
git clone https://github.com/simple10/nodestack.git
cd nodestack
npm install
```

# Development

NodeStack uses cake to start an express server. Cake is the Node equivalent of rake.

```bash
# Start web server on port 3000
npm start
```

http://localhost:3000

The command `npm start` is just an alias for `cake start`. See package.json "scripts" section.
By convention, startup scripts are defined in package.json to make them easy to find.

When `npm start` is run, server.js is executed which in turn loads the CoffeeScript compiler
and runs app/app.coffee. The app script loads plugins and routes and starts an express
server that listens for incoming connections. No magic.

Express is built on top of [connect](http://www.senchalabs.org/connect/) which is analogous
to rack. Connect is a middleware framework. All the work handling cookies, sessions, assets,
etc. is performed in optional middleware.

Connect Assets is connect middleware that handles compiling assets (CoffeeScript, Jade
templates, Stylus stylesheets, etc.) on the fly or to disk.

Connect Assets compiles assets into the **builtAssets** directory if the build config option
is set to true in app.coffee.

For development, build is turned off to make it easier to inspect and debug JavaScript and
CSS. Alternatively, build could be turned on by default and source files used for debugging.


# Production

As a best practice and required by hosts like Heroku, assets should be precompiled before
deploying to production.

Precompiling assets for production will combine and uglify javascript and stylesheet files.
Just like the Rails asset pipeline.

```bash
# compile assets into the builtAssets directory
cake precompile

git add .
git commit -m "Compile assets for production"

# deploy to heroku
git push heroku master
```

Since package.json does not specify specific npm module versions, it's a good idea to remove
npm_modules from .gitignore. This will ensure the same modules are running in development and
production.

