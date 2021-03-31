---
title: Savy Soda x SK
comments: false
---

A simple table of contents to get to what you're interested in:
* [Q & A](#QA)
* [Game Engine - ML](#Engine)
	* [Social Game Engine](#Arcadia)
* [Our awesome game](#Games)
	* [Storyline](#Storyline)
    
* PS My PSS username is 
> LimoDroid

(I backed the Kickstarter last year!)


# Savy Soda x SK

# QA
Some simple Q & A first:

* Who are we?
Simply put, SK (formerly known as AC0/RD) is a loose collective of developers, designers and science-people who are passionate about gaming and technology in general. We have 3 full-time members based in Perth:
* Arthur Passos | Design & Web | Shoelace.style, HTML, CSS, JS | Curtin University 
* Elijah Gardi | Dev & Physics | Unity, AWS | University of Western Australia
* Liam Arbuckle | Dev, ML & Web | Unity, Python (Full Stack), AWS | Offers from Curtin, RMIT, from Perth Modern School
We have 2 other teammembers who work with us on a part-time basis overseas:
* Rishabh Chakrabarty | Dev & ML | Unity, Python, AWS | Mumbai University
* Edwin Montgomery | ML & Outreach | Python, AWS | NASA/JPL (formerly)
As well as a number of outside collaborators and other team-members, including:
* Dylan Vekaria | Databasing | SQL, Unity | Perth Modern School
* Martin Evans | Dev | Unity, Java | Perth Modern School
* Chilumba Machona | Web, Hardware | Curtin University

We're trying to contribute to scientific research by working on our product line-up (see below):

* Who else is involved?
A lot of companies/teams have worked with us in the past:
* Worked with JPL on the 2019/20 Space Challenge Competition (Python/ML with AWS)
* Worked with HeroX on the 2020 Exploring Hell Competition (Python & Scientific Writing)
* Worked with Memberstack as full stack developers, as well as Peerboard
* We've started working with Ambasat (more on that later)
* We've done hardware debugging with WA-based company Cycliq as well as web development with them and an executive from Cycliq, Michael Freiberg, on other projects like Scentechnologies
* Started working with Podular Media on websites for The Sash & Talking City Podcasts
* Approached Crescent Moon games and currently (Liam is) working with Aurorian Studios
* Scientific writing and brainstorming with Josh Richards, future Mars astronaut (maybe)

* What do we make?
There's a few things we do/make, but at the moment we're devoting most of our time to our game and game engine. Two other projects (an interactive elearning platform for businesses and students, and a [stackoverflow-type platform for fandoms](http://ar.skinetics.tech/readriordan/)) are undergoing active development, while our "companion robot" project (which was our first, starting in 2015) is on hiatus. 


# Engine
Problem: 
* The scientific community is closed-off to outsiders. If you didn't go to university or study the right subjects, it can be hard to learn about different scientific fields
* It can be even harder to contribute to scientific research if you're not in the industry, no matter how interested you are
* A lot of the gaming community, especially in the case of PSS (cause it's a space game, obv) are interested in science/space/exploration

The solution: An optional way to contribute to scientific research through the analysing of data sets by playing the game and being rewarded with in-game items. 

Original solution: CCP Games - Eve Online Project Discovery. Looking at datasets from the Kepler Space Telescope and determining if those objects of interest were, in fact, exoplanets ([here's what a Kepler Object of Interest is](https://en.m.wikipedia.org/wiki/Kepler_object_of_interest#:~:text=A%20Kepler%20object%20of%20interest,Kepler%20Input%20Catalog%20(KIC).)). 
However, while this was a great initiative, it behaved more like a minigame within Eve Online than part of the actual game. 

A possible idea is that as part of the storyline/minigames you can land on planets generated from Kepler datasets and how the "planet" behaves can help with the player determining if this planet is real (as well as the program automatically documenting how the "planet" would behave if ships landed on it, for example). A lot of this citizen science idea generation is just a lot of idea generation. Like when a game DESIGNER tries to figure out how the inventory system should behave, we have to determine a system that contributes directly as well as being straightforward, informative and fun for the player (end user).

An actual setup we put together (using Unity addressables) involved the game Terragenesis (we talked about that today - 31.3.2021):
1. Random planet is generated using Kepler dataset
2. Planet follows oribital path (a new feature we added) in the game based on Kepler data. If something happens that's odd (i.e. because it's not actually a planet), the system will make a note of it but the player is also encouraged, while playing, to identify if weird things are going on (or if the atmospheric pressure is weird/changing). 
^^ This was the first phase

Then we made it a bit more difficult:
3. Players can splice 3 genes together to create life. How that life functions on different planets (based/created by the Kepler dataset) is returned to our own dataset, which catalogues what life could thrive on different types of planets based on their conditions/attributes, as well as returning an automatically generated paragraph back to the player explaining what happened - and more importantly, why.

There's so many ways this could be implemented in a game like PSS. I thought that adding a companion feature to the website (like in Arcadia, see below) could alleviate the concerns about CPU usage on a mobile device. Everything runs off a cloud computing (AWS, Azure, etc) service so I'm sure there's ways that we could get something together that is acceptable. 

## Arcadia
I actually came up with the idea for Arcadia (originally designed using a WP install) for a school project with Dylan & Martin and thought that I might as well keep working on it cause it's a really cool project!

* [Documentation](https://acord.bit.ai/docs/view/2vBzwziAShcxFrnE) - A bit technical but you'll understand a bit more about it
* [Canva product brief](https://www.canva.com/design/DAD8nLH2EV0/3J3mnD4y2WhN3IxMtjgqRg/view?utm_content=DAD8nLH2EV0&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton#10)

Basically, it's a fork of Facebook Games (but better). I noticed how on PixelStarships.com there's some limited interactivity with the game (sort of a companion app) and as someone interested in AR, companion apps, etc I think companion web apps are a really good way to start off the Arcadia platform. 

What is Arcadia (in case you didn't read the product brief - no problem :))?
* Game engine that orients around a web application
* Adds social networking to games (any game - not just ours!)
* Achievements, items, deaths, screenshots, anything can be shared
* Special minigames based on our game (more on that below!)
* Designs for handheld consoles (probably not something too interesting at the moment but in the future it could be really cool. We've opened up discussions with a [controller manufacturer](https://www.kickstarter.com/projects/rothandmyers/truley-5g-mobile-controller-for-cloud-gaming) about possibly working together on hardware creation

How does this work with Pixel Starships/Savy Soda?
Users can interact more with the game when not on their phone/gaming device. Not only can they buy and sell items, they can share interactive ship layouts (including AI patterns!), work on training and crafting/upgrading and do it in a socially constructive and collaborative way. We don't know how exactly your platform works, however we think we've got the social networking side of things downpat (with our years of experience with PHP & Python we'd hope so!) and we could definitely get something ready for PSS/SS

This is something that is on a slight hiatus at the moment because of our game development and quest to find funding, but it's something I dig out every now and then cause it's something that's really missing IMO. 


# Games
We've come up with a number of cool game ideas, like the one I told you about involving forces acting as gods. The old notes can be found [here](http://ar.skinetics.tech/stellarios/starsailors/#star-sailors-earthlings). We've also started working on some Unity projects and snippets as part of the [game creation]({{ site.baseurl }}/docs/unify). We've mainly been working on projects (3D & 2D/interchangeable) in unity to get our skills up, however Eli & Liam have been working on a 3d dogfighting minigame/miniscene in Unity involving reusable spaceship controllers. 

## Storyline
We've been having trouble getting our game off the ground due to our skills, costs, and asset creation (however we're working on that!). We thought we could transition our game into a series of storylines inside Pixel Starships. 

This is all just idea bouncing at the moment, but the PSS website could link player accounts so that our full game could be fully licensed to Savy Soda (SS) and playable both in a web-app mode (like the PSS web app) and the small parts in the mobile game. We're happy to develop the game ourselves for the early days, draw the assets and cover all the costs of development. Our game engine also has patents attached to it so we're either able to transfer them or create a patent cross-license between our team and Savy at any time. 

We've also tapped into Veonity & Keldian, two European power/space metal bands to record our game music for us. This is really important, as they've agreed to share our game to their audiences (we have also considered doing a Kickstarter and are working on a media kit for that for the future) and as they have a large audience it's a big chance for us to get some more people interested. We've mainly been working on gameplay mechanics recently:
* Inventory system (see [our drawings]({{ site.baseurl }}/docs/unify)
* PVE/PVP ideas
* How citizen science can actually play a role (we've been looking into Blockchain as part of our research)

Finally, we're investigating how minimalistic sandbox elements (sandbox rpg i guess) like block grids and focusing on the "cap'n" (the main character) can be implemented in companion games or in established games like PSS. Rishabh and I have worked on AR before so that's another area of interest to us.


# REPOS & Links!
* [NASA SpaceChallenge JPL](https://github.com/EXYNOS-999/AWS_JPL_OSR_DRL)
* [My Github profile](https://github.com/Gizmotronn)

More things here can open up in private discussions or if you're logged into our site (whatever works) once we get the ball rolling. 

* [Account](http://app.skinetics.tech)
* [Liam](http://l.skinetics.tech) & [More Liam](http://liam.skinetics.tech)

Don't forget to tell your mother about Pixel Starships, and tell your friends to go to pixelstarships.com!