# PAPS (Premier Arrivé, Premier Servi)

This Website was designed in the context of Supélec, to allow groups of students to show their motivation for organizing the school Gala.
It asks them to solve a different problem everyday a different problem, the fastest groups being allowed to get the most interesting tasks to do the the next day.

Feel free to reuse anything you might find useful here (content licensed under GPLv3+), but keep in that this being my first rails project, it is not necessarily a good example of elegant coding.



# Installation (for Debian)
- Install rvm (https://rvm.io/rvm/install)
  - Do not forget to add `source ~/.rvm/scripts/rvm` to your .bashrc
- Come in and out of your repo until RVM stops complaining
* For the next instructions, carefully stay inside the repo
- `gem install bundler`
- `sudo apt-get install mysql-server libmysqlclient`
- `bundle install`
- `cp config/database.yml.example config/database.yml`
- `cp config/secrets.yml.example config/secrets.yml`
- `rake db:migrate`


# Useful commands

- `rails server` : Starts a local webserver on port 3000
- `bundle install` : Launch at every Gemfile modification
- `rake db:migrate` : Launch at every database structure change
