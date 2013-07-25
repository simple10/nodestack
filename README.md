NodeStack
=======

Starter stack for Rails developers.

** Features **

* [Express](http://expressjs.com/) - web server
* [Connect Assets](https://github.com/adunkman/connect-assets) - asset pipeline
* [CoffeeScript](http://coffeescript.org/) - better JavaScript
* [Jade](http://jade-lang.com/) - better HAML
* [Stylus](http://learnboost.github.io/stylus/) - better SASS
* [Nib](https://github.com/visionmedia/nib) - stylus mixins

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
npm start
# `npm start` is just an alias for `cake start`
# See package.json "scripts" section.
# By convention, startup scripts are defined in package.json to make them self documenting.
```

When `npm start` is run, server.js is executed which in turn loads the CoffeeScript compiler
and runs app/app.coffee. The app script loads plugins and routes and starts an express
server that listens for incoming connections. No magic.

Express is built on top of [connect](http://www.senchalabs.org/connect/) which is analogous
to rack. Connect is a middleware framework where plugins (middleware) do all the work,
handling cookies, sessions, assets, etc. Connect Assets is connect middleware that handles
compiling assets (CoffeeScript, Jade templates, Stylus stylesheets, etc.) on the fly.


