#       _/      _/    _/_/      _/_/_/  _/_/_/    _/_/_/
#      _/_/  _/_/  _/    _/  _/          _/    _/
#     _/  _/  _/  _/_/_/_/  _/  _/_/    _/    _/
#    _/      _/  _/    _/  _/    _/    _/    _/
#   _/      _/  _/    _/    _/_/_/  _/_/_/    _/_/_/
#

describe 'Dummy tests', ->
  LOADING_TIMEOUT = 250
  TEST_TIMEOUT = 500

  beforeAll ->
    jasmine.getFixtures().fixturesPath = '.'
    jasmine.getFixtures().preload 'public/index.html'
    jasmine.getStyleFixtures().fixturesPath = '.'
    jasmine.getStyleFixtures().preload 'lib/css/foundation.min.css',
      'public/css/main.css'

  afterAll ->
    jasmine.getFixtures().clearCache()

  beforeEach (done) ->
    jasmine.getFixtures().load 'public/index.html'
    jasmine.getStyleFixtures().load 'lib/css/foundation.min.css',
      'public/css/main.css'
    done()

  afterEach (done) ->
    done()

  # Check documantation for more matchers:
  # - https://github.com/velesin/jasmine-jquery
  # - http://jasmine.github.io/2.4/introduction.html

  # Plain DOM-less test
  it 'they rocks', ->
    expect(true).toBe(true)

  # This is example of async test, so ypu may see dom for a moment
  it 'they have wrench', (done) ->
    setTimeout ->
      expect($('h1 .fi-wrench')).toBeInDOM()
      done()
    , LOADING_TIMEOUT
  , TEST_TIMEOUT
