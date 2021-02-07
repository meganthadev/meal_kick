# MealKick! README

## Welcome to MealKick! A simple app written with Ruby on Rails. A meal planning app where users can add and share their own recipes for meal planning, as well as comment on other's recipes, in a simple-to-use interface which makes meal planning... a real kick!

### Features

- Users of this app can create, view, or edit meals.
- Users can log in with google omniauth
- Users can create an account to store private meals/plans.


### Installation Instructions:

1) git clone: git@github.com:meganthadev/meal_kick.git
2) Run:   bundle install --full-index (installs all gems/dependencies)
2) Run:   git remote set-url origin git@github.com:meganthadev/meal_kick.git , then run   eval $(ssh-agent)  then 
  ssh-add ~/.ssh/id_rsa   then enter ssh passphrase just once before any git commits
3) Run: rails s to start server and open in browser to view/use application


### Dependencies

* Rails version - 'rails', '~> 6.0.3'

* gem 'bcrypt', '~> 3.1.7'
  gem 'omniauth'
  gem 'dotenv-rails'
  gem 'omniauth-google-oauth2





MIT License

Copyright (c) 2020 Megan Horsfield

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

