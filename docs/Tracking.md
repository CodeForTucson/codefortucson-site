# Analytics and Tracking

This site uses [Google Tag Manager](https://tagmanager.google.com/) to manage the addition, modification, and removal of tracking _tags_. Each tag specifies a particular metric or behavior for the site such as tracking with Google Analytics, running a campaign with Google AdWords, or one of many other Google services.

Although we could setup Google Analytics without using the Tag Manager, by using this product we can make complicated behaviors and changes through the online dashboard without touching the code for this site. This is particularly useful when wanting to do things like only triggering on a given page or click event.

The fetching code **must** appear right under the `<body>` opening tag and can be found in `_includes/google_tracking.html`. It loads the container id stored in `config.yml` which was created from within the Google Tag Manager [admin panel](https://tagmanager.google.com/#/admin/).

> Although the Google Analytics tracking code is also stored in `config.yml`, it is not used directly by the code for this site - it lives there as a reference only.

## Reviewing the Metrics

Login to the [Google Analytics Reporting screen](https://analytics.google.com/analytics/web/) to review the Analytics data.

## Note on Authentication

All access to any of the Google services must be authenticated with the Code for Tucson Google account. If you need the credentials but do not have them, please contact one of the brigade organizers.
