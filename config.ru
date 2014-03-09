#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

# stuff in lib
# require '../lib/sprockets_sinatra_middleware'
require File.expand_path("../lib/sprockets_sinatra_middleware", __FILE__)

run Padrino.application
