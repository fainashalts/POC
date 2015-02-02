                    # **Party On Code**
## written by *Faina Shalts, Alex Wines, and Joshua Munene*


What is it?
-----------
Party On Code is a is an education, social networking service and news website where registered community members can submit content as direct links. Registered users can then vote link submissions "up" to organize the posts and determine their position on the site's pages. Content entries are organized by areas of interest called "subtopics".

The Latest Version
------------------

Details of the latest version can be found under the project name POC (Party On Code) Git-Hub page under https://github.com/fainashalts/POC.

Installation
------------------
Party On Code requires Ruby 2.1.3
gem 'rails', '4.1.7'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'factory_girl_rails'
# Add Devise for authentication
gem 'devise'
# gem to allow us to show thumbnails of links submitted by users
gem 'link_thumbnailer'
gem 'acts_as_votable', '~> 0.10.0'
gem 'rspec-rails'
gem 'rails_12factor', group: :production 