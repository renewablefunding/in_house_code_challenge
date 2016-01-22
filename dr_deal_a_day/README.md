README
======

* Setup
  Change the version of ruby in in_house_code_challenge/.ruby_version to match your installed version. Mine was MRI 2.2.3
  Make sure you are using rbenv.
  Run: bundle install
  Run: bundle exec rake db:migrate RAILS_ENV=test
  Run: bundle exec rake db:seed

* running your application
  rails s -b 0.0.0.0

* interacting with the application as a user
  Enter http://localhost:3000 in your browser
  Login. The only user in the data base after seeding is 'tableman@csv.org' with password 'upload4you'
  Click the file upload button, find your file and click upload.
  The results page will show the total purchases for the upload and total purchases in the database

* running tests
  Run: bundle exec rake spec

* Philosophy
  This application was developed using TDD, implementing just enough code to make the tests pass, and just enough tests to meet requirements. Of course, much could be done to improve how robust, secure, beautiful and intuitive this application is. But these factors should be be driven by product management based on business cases. Without a case, additional time would be spent before establishing the corresponding value of the improvements.
