---
title: Announcing Chocobars
image: /assets/img/Chocobars.png
categories: Arcadia Games Python LibrariesModules 
published: true
comments: true
---

{% include jointcomments.html %}




While our flagship project Arcadia is a webapp (with some games on the network being downloadable, we decided overall it would be less restrictive to rely on progressive web app architecturre), at Signal Kinetics we've become increasingly aware of the ubiquity of desktop applications, and while cloud computing does seem to be taking over, we feel it would be a mistake to disregard the lessons that local applications taught us. One of those being that the user needs to be able to find everything they need easily - with just a click of the mouse along the top of the screen. We're talking about navigation menus, of course.

In our early mockups of the Arcadia website, we drew up sketches and mockups featuring it as just another website. However, due to the expandability and featureset we want to include in Arcadia, we feel that going with a standard material design-style header menu as our only option/point of navigation would be a bad move. This is for a number of reasons:

* If we get our way, we'll be introducing real-life gaming hardware. Due to the likelihood that these will be taken off-grid, progressive web apps won't function as well obviously in these situations (we're also unsure of how the base OS of this hardware will affect the functionality of the application - we've been trying to look into mobile-oriented versions of Raspbian due to our liking for Raspberry Pis, and it's going to be hard to treat the entire application as *just another webapp*

* Arcadia is designed to be playable offline, with your central character and stats being easily uploadable and downloadable whenever you rejoin the grid. There's a desire at SK to have our applications be truly universal, and that means they have the ability to work anywhere

* The beauty of Arcadia is that it can be used for more than just games - business applications and gamification in the corporate side is something we're also passionate about and we feel that Arcadia is perfect for this. Having a traditional desktop-app style is important for this area of Arcadia as well

What we're basically saying is.....we want to create a navigation system for Arcadia that has something for everyone. Whether you're using Arcadia as the basic webapp or you're downloading it to your laptop and want to create multiple toolbars, you're going to be able to fulfill your intense navigation dreams - and this is being accomplished with PyQt. Check the repo below (soon to be amalgamated into github/acord-robotics) to see what applets we're introducing to our open-source library of toolbars, menu items and navigation drawers.

![]({{site.baseurl}}/https://gh-card.dev/repos/gizmotronn/chocobars.svg?fullname=)
