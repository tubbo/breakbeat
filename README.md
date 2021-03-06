# Breakbeat

An automatic status page application I made for TelVue. Useful for keeping customers
up-to-date on outages or poor performance of their services. Breakbeat
should live on a VPS outside of your infrastructure, so it can provide
monitoring from a perspective closer to a customer's. It's also so that
when our entire infrastructure fails, Breakbeat will still be able to
provide status updates to our customer base.

## Features

- "Pings" various connected services regularly to obtain up-to-the-minute
  stats on the boxes they're running on, using `Net::HTTP` to make GET
  requests to their base path.
- Admin UI for editing uptime messages and adding new reports.

### Roadmap

- Builds uptime statistics and graphs from the given data

## Setup

Install dependencies:

```bash
$ bundle install
```

Set up the DB:

```bash
$ rake db
```

Start the server:

```bash
$ rails server
```

## Usage

In production, when you want to create a user, run:

```bash
$ rake user USER_EMAIL='hello@example.com' USER_PASSWORD='helloimindelaware'
```

Users can not be created from the API, but they can be updated. Since
users are for company staff only, you need box access in order to create
yourself a new user.

## Contributing

Write tests and submit a PR.
