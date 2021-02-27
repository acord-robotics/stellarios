---
description: >
  This part of the documentation covers our open-source E-Learning Platform,
  created with Flask & Shoelace for everyone
hide_description: false
published: true
---

# Elearning platform by Signal Kinetics
# State of development
We've been following a RAD-style model for the development due to the recent Hashnode Amplify Hackathon to rapidly bootstrap the application, with [Liam Arbuckle](https://sk.acord.software/larbuckle) & [Arthur Passos](mailto:arthur.passos@skinetics.tech) taking charge of the development. 
It's currently being developed on the [Signal Kinetics](https://github.com/signal-k) Github organisation with a Jira project management backend. 

<!--
Still to do:
* Determine how judges log in to the site and explain that
* What do we want, what do we have
* Commenting/emailing box for course help
-->

## Contents
* [Updates](#updates)
* [Actions](#actions)
* [Articles](#articles)




# Updates
## 20-22nd February 2021
We haven't gotten too much done over the weekend, but what we've been able to do is figure out how to fix the [login issue](https://signal-kinetics.atlassian.net/browse/AAH2-13?atlOrigin=eyJpIjoiZmJmM2MxOWM3NTZiNGQ5ZmI1NzhhYzQ3ZjEyMTQ2NWYiLCJwIjoiaiJ9) we're having. 

Issues:
1. When uploading files on a localhost based on github codespaces, the url would go to `localhost`, the file would still upload. I confirmed this was an issue relating to running it on Github Codespaces in the browser as when I transitioned it to Visual Studio Code[spaces] running locally and used the terminal inside the app to `flask run` it was able to run on `localhost` without any trouble.
e.g. Codespaces localhost: `https://3c15ea5d-86ea-4d72-9533-c9fe54e67996-5000.apps.codespaces.githubusercontent.com/`
Codespaces (vscode local) localhost: `127.0.0.1:5000`
![](https://i.ibb.co/b2MGcD0/image.png)
What we now need to work out is if the login/signup stuff has the same problem, or at the very least if it goes into the database file `db.sqlite` (search in extensions for `ext:sqlite`). Maybe the login/signup forms need work, so we could go back with the current model in [github/signal-k/`flask-1`](https://github.com/signal-k/flask-1/tree/flask-file-upload). There are other alternative solutions to that system that we should also have a look at.
![](https://carbon.now.sh/?bg=rgba%28255%2C255%2C255%2C1%29&t=theme%3Augaf9069pz&wt=none&l=application%2Fx-sh&ds=false&dsyoff=20px&dsblur=68px&wc=true&wa=false&pv=58px&ph=58px&ln=true&fl=1&fm=IBM+Plex+Mono&fs=18px&lh=167%25&si=false&es=2x&wm=false&code=export%2520FLASK_APP%253Dloginapp)

2. Integrating the design mockup done by [@artpassos](https://github.com/orgs/acord-robotics/people/artpassos) into the flask setup results in some broken pages. I've got a plan to turn those mockups from shoelace into react (ooooh a converter would be cool! maybe not specifically from react though) or at the very least into `/static` files that flask can work with. 

## 27th February 2021
It's gotten to the point where it's highly unlikely we'll be able to get much finished by the deadline but it was great fun to participate and we've learnt a lot about the structure and future flow of this platform, which we'll continue to work on. We'll still write an article on hashnode (and maybe their discord flow as well) with the required hashtag to generate some interest, show what we've done and prepare for the future. We've got some templates and the flow worked out, which has been amazing to see. 

-[L](https://github.com/gizmotronn)

## Issues/Tasks
[AAH2-25: Allow users to get updates on the latest courses](https://signal-kinetics.atlassian.net/browse/AAH2-25?atlOrigin=eyJpIjoiNTNjY2ZiMDgwYzExNGZhOWFlMDFjY2FhNDhmOTExYzciLCJwIjoiaiJ9)
Something a lot of elearning platforms have is an option for users (student users) to "subscribe" to content creators to get updates on new courses, as well as a global newsletter for new courses (I'm thinking of implementing something like the OneSignal "categories" where users can choose what notifications they want to get access to). I'm following https://dev.to/xinnks/sending-contact-form-messages-to-your-email-inbox-278 (this) to create a contact form for users to contact the teachers and also the creators (us) of this elearning software. This is something that I feel will be really useful as it opens up user engagement and paves the way for that engagement to turn into a comments form as well, which users will be able to then subscribe to, possibly link their account and newsletter/notifications to as well. 

I'm not really sure how this would work (it seems like a cool idea for our currently shelved "Notification shelf" app that Rishabh and I came up with last year) but maybe editing the OneSignal service worker to integrate with your account could be an option?

[AAH2-19: Render videos](https://signal-kinetics.atlassian.net/browse/AAH2-19?atlOrigin=eyJpIjoiOTg0ZDk1OWEzMzY3NDg1ZWIxZTg4YmIzY2ZjYjk2N2EiLCJwIjoiaiJ9)

# Actions
[![](https://img.shields.io/github/checks-status/signal-k/elearning/c0976aaf396161be244ffed50ba5489d1a2d5667?style=flat-square)](https://github.com/Signal-K/elearning/runs/1932367309)

See [compass]({{ site.baseurl }}/compass) for the full list of actions


# Articles
[![](https://img.shields.io/badge/-Introduction-yellow?style=for-the-badge&logo=dev.to)](https://dev.to/ac0rd-software/elearning-platform-e9d)
