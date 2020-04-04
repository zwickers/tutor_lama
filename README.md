# Tutor Lama 🦙

Tutor Lama is a web app for connecting tutors with students who go to the same university.
Justin Zwich - jaz2130
Kevin Qian - xq2194
Phivian Phun - pp2680

## Installation and Setup

### Facebook

Tutor Lama uses Facebook for user registration and authentication. After registering a project at developers.facebook.com, add environment variables to your deployment environment so Tutor Lama can make calls to the Facebook API.

```bash
export FACEBOOK_KEY=<your-facebook-app-id>
export FACEBOOK_SECRET=<your-facebook-secret>
```

In order to use the Facebook JavaScript SDK, Tutor Lama MUST be deployed on an SSL server. For a local development Ruby server with SSL support out-of-the-box, it's recommended to use [thin](https://github.com/macournoyer/thin)

Create an SSL certificate and key in the main project directory -- named localhost.crt and localhost.key, respectively -- and then start up the Ruby web server with:
```bash
thin start --ssl --ssl-key-file localhost.key --ssl-cert-file localhost.crt
```

### App Dependencies

* Ruby v2.6.3
* Rails v4.2.10

## Databases

SQLite3 is used for our development and testing databases.
Our production database is PostgreSQL, as this was needed to host the app on Heroku.

## User Stories and Testing suite

Three basic features with multiple scenarios are defined under /features.
See files under folder for user stories and cucumber tests.

See cucumber_tests_results-1.png and cucumber_tests_results-2.png for the visual output.
See cucumber_tests_results for the actual text file.

## Github link

https://github.com/zwickers/tutor_lama

## Heroku Deploy URL

https://pacific-ocean-83192.herokuapp.com
