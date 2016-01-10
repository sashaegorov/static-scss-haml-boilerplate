**NOTE:** This `README.md` is in progress. Sorry for typos.


# About this project
`SCSS`/`Haml`/`Coffescript` boilerplate for static pages served by Rack!
Yes. This is boiler plate for damn fast static prototyping.

**LT;DR**:
1. Run `bundle exec foreman start`
2. Edit or add some `SCSS`/`Haml`/`CoffeeScript` stuff in `src`.
3. Look at your browser — it will be already reload. Yay!

## Features
- Shipped with amazing [Foundation 6](http://foundation.zurb.com/) framework, take a look at files in `lib` directory.
- This thing supports source maps for almost everything
- Supports JavaScript testing via [Jasmine](jasmine.github.io) (on development environment only)


# How to work with this?

## Work with CoffeeScript
Just add it to `src/js` and save, result will appear in `tmp/js`. That is it. Sub-directories are supported i.e. `src/js/demo/demo.coffee` will be `tmp/js/demo/demo.coffee`.

## Work with SCSS
TODO: Yay!


# How to start local development?
Here are steps to run local development environment.
Please note all steps assume your are running all commands from repository folder.

## Ruby
You will need Ruby interpreter version `2.2.4`. Refer to your operating system manuals. It also recommended to use either `rvm` or `rbenv` to manage your Rubies locally.

##  Bundler
This project uses `bundler` to manage Ruby dependencies.
In order to install it just fire up `gem install bundler`. After run `bundle install` to get rest of things.

**NOTE:** During executing bundle install on Mac you may get following error:
```
Installing eventmachine 1.0.8 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
```
To fix it, run `brew link openssl --force` and then run again `bundle install`.

## Running Foreman
Next you should run:
```
bundle exec foreman start
```

## `Puma` web-server variables
Here is the list related environment variables.

- **`RACK_ENV`** Rack-environment to run application, default is *development*. Other possible options are `test` and `production`.
- **`PUMA_WORKERS`** number of workers, default is *2*
- **`PUMA_THREADS_MIN`** *minimal* number of threads per worker, default is *2*
- **`PUMA_THREADS_MAX`** *maximal* number of threads per worker, default is *4*
- **`PUMA_PORT`** port to bind application on, default is *3000*
- **`PUMA_USE_PRELOAD`** tells Puma to preload application, this makes [phased restart](https://github.com/puma/puma#normal-vs-hot-vs-phased-restart) impossile, use any string value to enable, *isn't used by default* .

# Heroku
This thing is Heroku-ready, which means you can just `git push heroku master` it to your application and it's done.

# Project structure
Here is the directory structure:

**`├─ config/`** — folder with various configs
**`├─ lib/`** — served shared assets, *add your libraries here*
`│  ├── css/` — shared stylesheets
`│  ├── fonts/` — fonts
`│  └── js/` — shared scripts
**`├─ tmp`** — served compiled stuff, it's **NOT** tracked by Git
`│  ├── css`
`│  └── js`
**`├─ spec`** — Jasmine stuff
`│      └── ...`
**`└─ src`** — sources
`  ├── js`
`  └── scss`


# TODOs
To be done in near future:
- Add authentication
- Add `Foundation 6` framework as a context off `main.scss`
- Rake clean up task
- Jasmine as middleware in order to mount it to `/jasmine`
- Auto-detect all `*.html`/`*.haml` files to build index
- `*.dev.js` versions of scripts


# Contribute
There are some stuff which, should be updated periodically:
- `Foundation 6` which is places in `lib/css` and `lib/js` folders
- `jasmine-jquery` which inside `spec/javascripts/helpers/jasmine-jquery.js`
