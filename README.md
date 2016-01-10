<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [About this project](#about-this-project)
	- [Features](#features)
- [How to work with this?](#how-to-work-with-this)
	- [Work with CoffeeScript](#work-with-coffeescript)
	- [Work with SCSS](#work-with-scss)
- [How to start local development?](#how-to-start-local-development)
	- [Ruby](#ruby)
	- [Bundler](#bundler)
	- [Running Foreman](#running-foreman)
	- [`Puma` web-server variables](#puma-web-server-variables)
- [Heroku](#heroku)
- [Project structure](#project-structure)
- [TODOs](#todos)
- [Contribute](#contribute)
- [Demo](#demo)

<!-- /TOC -->

[![Dependency Status](https://gemnasium.com/sashaegorov/static-scss-haml-boilerplate.svg)](https://gemnasium.com/sashaegorov/static-scss-haml-boilerplate)

**NOTE:** This `README.md` is in progress. Sorry for typos.

# About this project

`SCSS`/`Haml`/`Coffescript` boilerplate for static pages served by Rack! Yes. This is boilerplate for damn fast static prototyping.

**LT;DR**:
- Run `bundle exec foreman start`
- Edit or add some `SCSS`/`Haml`/`CoffeeScript` stuff in `src`.
- Look at your browser — it will be already reload. Yay!

## Features
- Shipped with amazing [Foundation 6](http://foundation.zurb.com/) framework, take a look at files in `lib` [directory](https://github.com/sashaegorov/static-scss-haml-boilerplate/tree/master/lib).
- This thing supports source maps for almost everything
- [Supports](https://github.com/sashaegorov/static-scss-haml-boilerplate/tree/master/spec/javascripts) JavaScript testing via [Jasmine](jasmine.github.io) (on development environment only)

# How to work with this?

## Work with CoffeeScript
Just add it to `src/js` and save, compiled result will appear in `public/js`. That is it. Sub-directories are also supported e.g. add `src/js/demo/demo.coffee` and it will appear as `public/js/demo/demo.coffee`.

## Work with SCSS

**TODO:** Yay!

# How to start local development?
Here are steps to run local development environment. Please note all steps assume your are running all commands from repository folder. Currently instruction only tested on `OS X`.

## Ruby
You will need Ruby interpreter version `2.2.4`. Refer to your operating system manuals. It also recommended to use either [`rvm`](https://rvm.io/) or [`rbenv`](https://github.com/rbenv/rbenv/) to manage your Rubies locally.

## Bundler
This project `bundler` to manage Ruby dependencies. In order to install it just fire up `gem install bundler`. After run `bundle install` to get rest of things.

**NOTE:** During executing bundle install on Mac you may get following error:
```
Installing eventmachine 1.0.8 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
```
To fix it, run `brew link openssl --force` and then run again `bundle install`.

## Running Foreman

Next you should run:
```
bundle exec foreman start -f Procfile.dev
```
You should see something like that:
```
09:31:01 jasmine.1 | Puma 2.15.3 starting...
09:31:01 jasmine.1 | * Min threads: 0, max threads: 16
09:31:01 jasmine.1 | * Environment: development
09:31:01 jasmine.1 | * Listening on tcp://0.0.0.0:8888
09:31:01 web.1     | [97141] Puma starting in cluster mode...
09:31:01 web.1     | [97141] * Version 2.15.3 ...
...
09:31:01 web.1     | [97141] * Phased restart available
09:31:01 web.1     | [97141] * Listening on tcp://0.0.0.0:5100
```

Visit [localhost:5100](http://localhost:5100) to see boilerplate or [localhost:8888](http://localhost:8888) to see page with tests.

## `Puma` web-server variables
Here is the list related environment variables.

- **`RACK_ENV`** Rack-environment to run application, default is *development*. Other possible options are `test` and `production`.
- **`RACK_USER`** user name for simple authentication
- **`RACK_PASSWORD`** password for simple authentication
- **`RACK_OPAQUE`** needs to be set to a constant base64/hexadecimal string e.g. run `ruby -r securerandom -e 'puts SecureRandom.hex'`
- **`PUMA_WORKERS`** number of workers, default is *2*
- **`PUMA_THREADS_MIN`** *minimal* number of threads per worker, default is *2*
- **`PUMA_THREADS_MAX`** *maximum* number of threads per worker, default is *4*
- **`PUMA_PORT`** port to bind application on, default is *3000*
- **`PUMA_USE_PRELOAD`** tells Puma to preload application, this makes [phased restart](https://github.com/puma/puma#normal-vs-hot-vs-phased-restart) impossible, use any string value to enable, *isn't used by default* .

# Heroku
This thing is Heroku-ready, which means you can just `git push heroku master` it to your application and it's done.

**Check list:**
- Add `RACK_USER`, `RACK_OPAQUE` and `RACK_PASSWORD` variables

# Project structure
Here is the directory structure:
- **`├─ config/`** — folder with various configs
- **`├─ lib/`** — served shared assets, *add your libraries here*
- `│  ├── css/` — shared stylesheets
- `│  ├── fonts/` — fonts
- `│  └── js/` — shared scripts
- **`├─ public`** — served compiled stuff, it's _NOT_ tracked by Git
- `│  ├── css` ...
- `│  └── js` ...
- **`├─ spec`** — Jasmine stuff
- `│      └── ...`
- **`└─ src`** — sources
- `│  ├── js`
- `│  └── scss`

# TODOs
To be done in near future:
- Add `Foundation 6` framework as a context off `main.scss`
- Jasmine as middleware in order to mount it to `/jasmine`
- Auto-detect all `*.html`/`*.haml` files to build index
- `*.dev.js` versions of scripts
- ~~Rake clean up task~~
- ~~Add authentication~~

# Contribute
There are some stuff which, should be updated periodically:
- `Foundation 6` which is places in `lib/css` and `lib/js` folders
- `jasmine-jquery` which inside `spec/javascripts/helpers/jasmine-jquery.js`

# Demo
Try it [here](https://static-scss-haml-boilerplate.herokuapp.com/) with `admin:a633e579f476` login and password.
