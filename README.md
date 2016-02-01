# Apprenticeship-RubyTicTacToe

Tic Tac Toe Core Game implemented in Ruby

[![Master Build Status](https://travis-ci.org/gemcfadyen/Apprenticeship-RubyTicTacToe.svg?branch=master)](https://travis-ci.org/gemcfadyen/Apprenticeship-RubyTicTacToe)   [![Master Coverage Status](https://coveralls.io/repos/gemcfadyen/Apprenticeship-RubyTicTacToe/badge.svg?branch=master&service=github)](https://coveralls.io/github/gemcfadyen/Apprenticeship-RubyTicTacToe?branch=master)

To run the application clone the project into a folder

>> git clone git@github.com:gemcfadyen/Apprenticeship-RubyTicTacToe.git

To recreate the gem, do
>> gem build ttt-core.gemspec

To install locally, do
>> gem install ./ttt-core-0.0.1.gem

This will install the gem to the ttt gemset.
To use this gem, add the following to your Gemfile:

`gem ttt-core, '0.0.1'`

(update the version as appropriate)

Ensure your project will look at the ttt gemset path. Run `gem env` and check if the ttt gemset is listed under GEM PATHS.

If it is not, you can configure it by running
>> rvm 2.2.1@ttt

Run `gem env` again, and check that the gemset is listed under the GEM PATH.
