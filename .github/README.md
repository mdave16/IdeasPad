# IdeasPad

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/7c5352e468c74ac7a08dbff02ca39aa1)](https://www.codacy.com/app/mdave3927/IdeasPad?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mdave16/IdeasPad&amp;utm_campaign=Badge_Grade)[![Build Status](https://semaphoreci.com/api/v1/mdave16/ideaspad/branches/master/shields_badge.svg)](https://semaphoreci.com/mdave16/ideaspad)

IdeasPad is a small blogging application focusing on ideas for programmers to work on. The aim is to have tags, difficulty suggestions, languages, topics... etc. attached to an 'idea' which will allow people to visit the website and get an idea to work on.

## Local Development

Only `docker` and `docker-compose` are required. 
To develop, first build the image:

`docker-compose build web`

## Database creation

After having built the image, we need to create the database before running. 

`docker-compose run --rm web rails db:create db:migrate`

## Run the server

`docker-compose up web`

### How to run the test suite

`docker-compose run --rm web rails test`

## How to deploy 

Basically, you don't. Everything should automagically work from the CI. The only time a change needs to be made is when changing the database structure, we have to run migrations manually on Heroku CLI.
