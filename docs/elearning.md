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
* [About the app](#about)
* [Updates](#updates)
	* [What we've got](#current-state)
* [Git[hub]Actions, Workflows & Files](#actions)
* [Articles](#articles)


# About
*Written by [@artpassos](https://github.com/artpassos)*
***Tools, front-end and libraries***

The app was design using Figma and the front-end in Microsoft Studio Code (unfortunately just the login screen for now).  The first choice was to customise elements from the sholace.style library.  Shoelace is very light and works smoothly across any web application and it is likely that we will be trying to bring this library into SK’s eLearning platform to cut development time.

Another library used for illustrations,  that I highly recommend is [Undraw.co](http://undraw.co) . There are some very useful illustrations and all of them are in vector format, which allow us to edit each layer of the illustration. 

***User flow***

There is not much about to say about the user flow. It is very intuitive, simple and not different than other eLearning platforms or even social media. The idea is to make the platform easy to use and manage, accessible to every level of familiarity with webapps and the internet.  The user can create a new account by defining a user account (no email necessary) or login into an existing account. Also, users can be invited by content creators to the platform via email or by a shared link.

The first screen that the user see is a dashboard to monitor progress and access the courses enrolled.  Relevant information such as percentual of courses completed and access to the latest courses, displayed at the beginning of the list.  For content creators, or teachers, the courses created by them will be available on the dashboard.  Information about each course will be presented, such as the number of students enrolled, engagement and if the course is published - available for search in the platform.  Users can also explore other courses by accessing the tab *Explore*, giving it more opportunities develop new skills.

Courses have no limit in the number of chapters or individual lessons.  Chapters can contain videos, quizzes, tests, text or zip files to be downloaded by the user – resources for instance.  Each course can also have deadlines by chapters or the whole course.  The course structure is very flexible, accommodating any type of subject.

***Visual identity (the fun part!)***

The general visual identity of the application reflects what is trending in the web/app development, making it friendly and visually pleasant to any type of user.  In order to make the application easy to navigate, many design principles are applied. For instance, most elements, including typography, present elements with smooth edges, following a principle called contour bias.  This principle states that element with round edges can be perceived as *friendly,* and therefore, can make the user more comfortable using the application.

Back to typography, the main font used is an open-source Sans-Serif from Google Fonts with smooth edges called *Open Sans.*  To create contrast, another Google Font with serif, creating balance and a visual balance among elements that represent different level of information.

A light pastel colour scheme also features the platform, avoiding eyes strain and reinforcing the *friendly* image of the application. These colours are also presented in gradients, a recent trend in the market.  This also complement the idea of *fun* and *friendly* represented in other elements in the composition.

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

### Current state 
As of this [latest update](https://acord.software/stellarios/docs/elearning/#27th-february-2021), we've got some beautiful forms and templates designed by Arthur Passos in Figma/Adobe XD, a simple web application built with Flask and ways to tie it all together. 

[Login forms](https://signal-kinetics.atlassian.net/browse/AAH2-20?atlOrigin=eyJpIjoiMmZlMzFlZDA5OTE2NGU2MDhkOWZhODdlNGMzMWMwMGIiLCJwIjoiaiJ9):

![bd3660c4-2084-4e79-a2cb-f1f6f66a3aa9.png]({{site.baseurl}}/docs/bd3660c4-2084-4e79-a2cb-f1f6f66a3aa9.png)


![2aea31a8-1acc-44fc-9ce9-d35631cd2e0d.png]({{site.baseurl}}/docs/2aea31a8-1acc-44fc-9ce9-d35631cd2e0d.png)


![bbddf502-4052-48b9-a9cf-2b4214d9d805.png]({{site.baseurl}}/docs/bbddf502-4052-48b9-a9cf-2b4214d9d805.png)


What we have done is we've tried to make them responsive. After desigining them in Figma and exporting them using Animaapp, we then went about adding some custom `css` to customise how the `div` elements render on different screen sizes. The images shown above are simply different mockups, the desktop image is the one that the code is based on. The responsiveness for these files/pages is done using css media queries:

![carbon (2).png]({{site.baseurl}}/docs/carbon (2).png)

We plan to conduct a similar approach for the student/teacher (the user) dashboard, which will consist of videos/courses, featured/new courses (in a carousel-based feed), and an account/course management system. 

The code for this is all available at [this repo](https://github.com/signal-k/elearning)

#### Flask databases
We haven't really been able to get much of the flask backend working yet, but here's the full plan for the `flask-sqlalchemy`-based database:

* User - 
	* Username (Done)
    * Password (Done) - hash function with werkzeug
    * Email Address
    * Local time (Done - automated)
    * User ID (Done - Primary Key)
    * All this user's posts (Done - linkes to "user who posted" from Post class)
    * Enrolled courses (as a student) - linkes to "Course ID"/"Enrolled Students" in Courses class
* Posts (like status updates) -
	* Title
    * Body (Done)
    * Time of post (Done)
    * User who posted (Done - Foreign Key)
    * Post ID (Done - Primary Key)
* Courses (One user can have many courses)
	* Title
    * Description (like `Body` in Post(s) class)
    * Teacher/Instructor - user foreign key
    * Enrolled students - user foreign key
    * Course ID (Primary Key)
    * Video ID (Foreign Key)
    * Any extra content....
* Videos (One course can have many videos)
	* Title
    * Desc
    * Course ID (Foreign Key)
    * Video ID (Primary Key)
    * Extra files/content

We hope to save the watch state of a user/their progress through the course so that on their student dashboard they're able to jump straight back in, with a similar layout to this:


| Sidebar | Main Area |
|---|---|
| Student Dashboard (Icon/Link) | Most recent courses (carousel) |
| Teacher Dashboard (Icon/Link) | Carousel ^^ continues |
| Profile Settings (Icon/Link) | Course feed (carousel) |
| Bookmarks/user content (Icon/Link) | Carousel ^^ continues |

The sidebar will be collapsible and provide links to manage the courses you create, or view the courses that you're currently enrolled in (users can be both teachers and students without having to create new accounts). 

User bookmarks could possibly be implemented with a form and then a `db.commit()`.

Next step - Amplify and connect the Login form to the database!


## Issues/Tasks
[AAH2-25: Allow users to get updates on the latest courses](https://signal-kinetics.atlassian.net/browse/AAH2-25?atlOrigin=eyJpIjoiNTNjY2ZiMDgwYzExNGZhOWFlMDFjY2FhNDhmOTExYzciLCJwIjoiaiJ9)
Something a lot of elearning platforms have is an option for users (student users) to "subscribe" to content creators to get updates on new courses, as well as a global newsletter for new courses (I'm thinking of implementing something like the OneSignal "categories" where users can choose what notifications they want to get access to). I'm following [this](https://dev.to/xinnks/sending-contact-form-messages-to-your-email-inbox-278) to create a contact form for users to contact the teachers and also the creators (us) of this elearning software. This is something that I feel will be really useful as it opens up user engagement and paves the way for that engagement to turn into a comments form as well, which users will be able to then subscribe to, possibly link their account and newsletter/notifications to as well. 

I'm not really sure how this would work (it seems like a cool idea for our currently shelved "Notification shelf" app that Rishabh and I came up with last year) but maybe editing the OneSignal service worker to integrate with your account could be an option?

[AAH2-19: Render videos](https://signal-kinetics.atlassian.net/browse/AAH2-19?atlOrigin=eyJpIjoiOTg0ZDk1OWEzMzY3NDg1ZWIxZTg4YmIzY2ZjYjk2N2EiLCJwIjoiaiJ9)

# Actions
[![](https://img.shields.io/github/checks-status/signal-k/elearning/c0976aaf396161be244ffed50ba5489d1a2d5667?style=flat-square)](https://github.com/Signal-K/elearning/runs/1932367309)

See [compass]({{ site.baseurl }}/compass) for the full list of actions

| File | Description | Issue # |
|---|---|---
| Full Figma [Export](https://github.com/Signal-K/elearning/pull/13) | All the html files/pages, designed in Figma, for this iteration of the project | [#12](https://github.com/Signal-K/elearning/pull/12#issue-581465144) |
| Login function (old) | A login form with limited database functionality with Flask (part of learning/prototyping) | [#11](https://github.com/Signal-K/elearning/tree/main/loginapp) |


# Articles
[![](https://img.shields.io/badge/-Introduction-yellow?style=for-the-badge&logo=dev.to)](https://dev.to/ac0rd-software/elearning-platform-e9d)
