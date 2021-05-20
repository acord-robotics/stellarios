---
image: https://keybase.io/images/blog/teams/teams-tab.png
categories: Git Repos
comments: true
---

# Introducing Keybase for SK
It's been a while since we've updated our development log, but we've still been working hard on tons of projects (as seen in our updated [docs]({{ site.baseurl }}/docs) pages).


An update about git, and where we've been:
> We've made the decision to create a second Github organisation, [github/signal-k](https://github.com/signal-k) which houses the "root" repositories. [github/acord-robotics](https://github.com/acord-robotics) will house smaller components, like specific api components, legacy repositories, forks and spare branches, as well as forks of other projects like the OSR, and will be hooked into [github/signal-k](https://github.com/signal-k) via submodules/forks.
In addition to this update, we're also spending a lot of time on Keybase (more on this below).



We're taking a little bit of time off compared to the start of the year where everyone had plenty of time to work on the team and our projects, but I'm still going to be around and am still spending plenty of time filling in the gaps on our projects.

If you don't know much about [keybase](https://keybase.io), I'd recommend having a look through their [documentation](https://book.keybase.io/docs/files). Basically, we're combining our Github orgs (through a flask-based RESTful API) with Keybase which will take over as our main method of inhouse communication.

Leave a comment here if you'd like to be added to the group!

# GeminiStation

| [Deployment](https://github.com/acord-robotics/api-heroku/tree/main/GeminiStation) | Platform | [![](https://img.shields.io/github/labels/acord-robotics/api-heroku/jira?color=green&label=Issues:t&logo=replit&style=social)](https://github.com/acord-robotics/api-heroku/issues/2) |
|---|---|---|
| Flask Material Dashboard | Codeship: [![](https://img.shields.io/codeship/0fd7c046-5825-4d75-ad81-0d14910a9ec2?color=green&logo=codeship&logoColor=green&style=for-the-badge)](https://app.codeship.com/projects/0fd7c046-5825-4d75-ad81-0d14910a9ec2/builds/641ffb10-d53a-46b8-8254-bf4d4daed2e5?component=1a48e666-6a80-440e-b7fa-54a979da5b04_1621416435_combined) | [![](https://img.shields.io/github/labels/acord-robotics/api-heroku/jira?color=green&label=GSCA-2&logo=replit&style=social)](https://signal-kinetics.atlassian.net/browse/GSCA-2) |
| Documentation/Code | [Github Tree](https://github.com/acord-robotics/api-heroku/tree/main/GeminiStation) | / |
| FMD -> Customised Gunicorn | Codeship: [![](https://img.shields.io/codeship/4d67960f-4849-41b0-9a1f-701e010eacc2?label=Build%20%28Gunicorn%2019.10.0%29&logo=codeship&style=flat-square)](https://app.codeship.com/projects/4d67960f-4849-41b0-9a1f-701e010eacc2) | [![](https://img.shields.io/github/labels/acord-robotics/api-heroku/jira?color=green&label=GSCA-2&logo=replit&style=social)](https://signal-kinetics.atlassian.net/browse/GSCA-2) |
| `signalkinetics` | [![](https://img.shields.io/keybase/xlm/G1zmotronn?logo=keybase&style=social)](https://keybase.io/team/signalkinetics) | / |
| FMD -> `run.py` | [Vercel](https://vercel.com/gizmotronn/flask-material-dashboard) | [![](https://img.shields.io/github/labels/acord-robotics/api-heroku/jira?color=green&label=GSCA-2&logo=replit&style=social)](https://signal-kinetics.atlassian.net/browse/GSCA-2) |


