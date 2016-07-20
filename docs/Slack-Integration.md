# Slack Integration

On the front page of the site there is a button to click on
which shows the current number of active users in the Slack
team and it also offers an invite button so that people can
join our Slack group without needing to go through a manual
invitation process.

## How does it work?

The integration relies on [Slackin](https://github.com/rauchg/slackin),
which injects an `iframe` into the page to provide the button
and invitation form.

Slackin relies on a running server, which we have deployed on
[Heroku](https://dashboard.heroku.com/apps/codefortucson-slackin).
If you do not have access to the Heroku dashboard and need it,
please request access from one of the brigade organizers.

The Heroku app relies on two environment variables to operate properly.

```
SLACK_API_TOKEN=my-api-token-here
SLACK_SUBDOMAIN=codefortucson
```

The Slack API token needs to be associated with a Slack account
with administrative access, otherwise no invites will be sent.
You can generate a "test token" on [Slack's API page](https://api.slack.com/docs/oauth-test-tokens).

## Integration

Because we are requesting `slackin` remotely, we need to keep the
following URLs up to date.

 - In `config.yml`, the `slackin_url` variable
 - In `README.md`, the SVG icon url at the top
