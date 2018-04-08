# IdeasPad

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/7c5352e468c74ac7a08dbff02ca39aa1)](https://www.codacy.com/app/mdave3927/IdeasPad?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mdave16/IdeasPad&amp;utm_campaign=Badge_Grade)[![Build Status](https://semaphoreci.com/api/v1/mdave16/ideaspad/branches/master/shields_badge.svg)](https://semaphoreci.com/mdave16/ideaspad)

IdeasPad is a small blogging application focusing on ideas for programmers to work on. The aim is to have tags, difficulty suggestions, languages, topics... etc. attached to an 'idea' which will allow people to visit the website and get an idea to work on.

* Ruby version

I'm using ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]
But this should compile with other versions too. Once there is a docker image, you won't need to worry about versions - I think.

* System dependencies

We are using pg, so you would need this installed (again until docker)


* Database creation

- you will need to set up your db in the same way as me (I think)
1) download postgres - see their website
2) create a user called ideaspad <-- this guy is who owns all my tables

`bash> sudo -u postgres psql`
`psql> create role IdeasPad with createdb login;` (role name is auto lowercased)

3) set his connection as trust in the config file

`bash> sudo nano /etc/postgresql/9.5/main/pg_hba.conf && service postgresql restart`
```
# put config here
...
local  all  ideaspad  trust
...
```
4) create a db for development

`bash> createdb -U ideaspad IdeasPad_development`

* How to run the test suite

First time: `bash> createdb -U ideaspad IdeasPad_test`
then `rails test` should run all tests written

* Deployment instructions
LOCAL:

rails s should start everything up if you have database configured.

PROD:

See Contributing.md in the repo - but essentially, don't do anything until you are ready, and then open a pr, you can only merge the pr when the build passes on semaphore and passes codacy. Once merged, master is immediately deployed live.
If you added any database stuff, you have to run the migrations manually on heroku.
