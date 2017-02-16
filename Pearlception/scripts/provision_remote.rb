#!/bin/env ruby

ENV['RAILS_ENV'] = "development" # Set to your desired Rails environment name
require '/../config/environment.rb'
require 'active_record'

client = Mysql2::Client.new(:adapter  => "mysql2",
    :host     => ENV['STATS_DB_URL'],
    :username => ENV['STATS_DB_USER'],
    :password => ENV['STATS_DB_PASS'],
    )

#client.query("CREATE DATABASE company_db")