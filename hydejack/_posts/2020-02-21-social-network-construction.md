---
title: Constructing Social Networks
image: /assets/img/social-networking-service.jpg
comments: true
hide_description: false
description: >
  We're all on social media, and we're always on the lookout for groups around
  the interwebs that house people with similar interests to us. We comment on
  forum boards and say our thoughts in the replies of various blog posts, but
  what's the best way to make your own social network that is engaging and
  people will use?
published: true
---



{% include jointcomments.html %}

# Contents
* [Things you need](#things-a-social-network-needs)
* [Wordpress](#wordpress)
   * [Buddypress](#buddypress)
   * [Plugins for Buddypress](#plugins-for-buddypress)
   * [Alternatives to Buddypress](#alternatives-to-buddypress)
* [Bootstrap](#bootstrap)
	* [What is Bootstrap?](#what-is-bootstrap)
    * [Bootstrap for your social network](#bootstrap-for-your-social-network)
    * [When you'd use Bootstrap](#when-to-use-bootstrap)
    * [Bootstrap and a CMS?](#bootstrap-and-a-cms)
* [Dashboards](#a-quick-word-about-dashboards)

Since 2016, I, and AC0/RD have used Wordpress (a content management system that incidentally is the software used for over 25% of the world's websites) for our social media. I never paid much attention to the comments system on Wordpress, because the main stuff happened on the forums, and I considered the comments section to just be for non-members posting comments on the blog posts (at the time, our website was entirely log-in only and that's why comments were not high up on the priority list for us). However, comments systems like Disqus can be used for a type of forum, and that's one of the things I'll be talking about in this post.

# Things a social network needs
Your website is a social network if it has any of the following types of user interaction:
* Games - for example web-based RPGs
* Comments sections - mainly used in blog posts
* Q&A Forums
* Support Forums
* Community Forums
* User profiles
* User gamification
* User groups 
* + more user stuff (check out something like Buddypress to see what you can do with membership sites!)

I'm going to over each of these in-depth over the course of this post. I'd also recommend checking out [my post on HTML dashboards](https://acord-robotics.github.io/acord-robotics.github11//2020/02/23/start-the-day-with-the-right-habit/ "HTML Dashboards") as it's a good way to get all the community traffic in one place.

> "Your dashboard is a great place to keep track of all the activity from your users

Most platforms that are used by developers can do most of the things mentioned above, but it can take a bit of fiddling around if you use a static site platform like Bootstrap, Jekyll or GoHugo. I'd recommend checking out [Codepen](http://codepen.io) for code snippets, which you can then modify yourself to fit your needs. If you're using Wordpress or another CMS, it's easy enough to set-up - just install a plugin like Buddypress or PeepSo. You do want to make sure that you don't have too many plugins installed on Wordpress, though, as it runs the risk of your site loading incredibly slowly (at our "peak", the AC0/RD website was taking upwards of 15 seconds to load)...

Let's take a look at the best platforms for creating a social network:

# Wordpress
![](https://www.wpexplorer.com/wp-content/uploads/wordpress-com-vs-org-infographic.png)
When we talk about Wordpress, we're talking about Wordpress.org, not wordpress.com - also known as the self-hosted version. I'm not going to explain the differences between Wordpress & Wordpress.com, but there's a great blog post that you should check out: https://ithemes.com/tutorials/wordpress-com-vs-wordpress-org/

Wordpress (.org) is extremely extensible, with over 50,000 plugins freely available on the Wordpress repository, and many thousands of companies that develop premium themes and plugins. One of the most popular, and most important, is Buddypress, which is actually developed by the Wordpress community (i.e. it is open-source). 

![](https://socialengineindia.com/blog/wp-content/uploads/2019/01/social-networking-service.jpg)

#### Buddypress
Buddypress is a plugin that adds the following features to your wordpress website:

* User profiles
* Friends (like on Facebook)
* User wall (status updates)
* Groups
* Private messaging between members
* Notifications

This is already quite good, but with the availability of plugins that *extend* buddypress, you'd be crazy to stop there. There's so much more that you can add:

* Integration with your forum --> BBPress
* User photo & video galleries --> RTMedia/Mediapress
* Completely customize & re-skin Buddypress --> Youzer by Kainelabs $$
* Buddypress User Blog --> Buddyboss $$
* Buddyforms Members (alternative to BUB above)
* Buddypress Global Search
* Woocommerce Buddypress Integration --> Woocommerce (E-Commerce)

![](https://blog.hubspot.com/hs-fs/hubfs/Imported_Blog_Media/BuddyPress-Global-Search-2.png?width=1300&height=900&name=BuddyPress-Global-Search-2.png)

###### Plugins for buddypress

Because Buddypress is open-source, anyone can update it and create their own plugins for it. This can be good, because as there are millions of PHP & Wordpress developers around the world, there's a huge chance that the plugin you're looking for to extend Buddypress (or any other part of your website, in fact) already exists. Even if it doesn't, you can always hire a developer to create a specific plugin for you, or learn how to do it yourself.

Buddyboss is one of the best developing companies of BP plugins around. The great thing is that they create a theme for a solution, which means that apart from inserting your branding and customizing the colours, it's ready to go as soon as you install it. There's shop-specific themes and you can make a site like Udemy or Coursera with Buddyboss's platform. Buddyboss also develops plugins, which are sometimes included in their themes.

Buddyboss is a great example, because their products act like an ecosystem. If you have a Macbook, an iPhone, an iPad and tons of iCloud storage, everything works great, doesn't it? There's no compatability errors between the products, because they're developed by the ONE company that's primary focus is making things as good and easy to use as possible (as an Android & Windows fan, I agree that this is one of Apple's best attributes). It's the same thing when building a website - not just a wordpress social network, but any sort that requires extensions or plug-ins. If you've ever owned a microsoft (i.e. the hardware is made by Microsoft, for example the Surface series of devices) laptop and an android phone (like I do), a lot of things that are possible in the Apple ecosystem just simply aren't possible. Some things work poorly together.

If you have a free buddypress extension from an open-source developer, it's not necessarily a bad thing. But since it's free & open-source (for example, it may have been hosted on Github), the developer is under no obligation to continue updating it or to even offer support (just like Apple aren't obligated to give support to second-hand products). Another problem is that since s/he's not being paid to develop the plugin, the care and time and money poured into it would be dwarfed by the time, care and money that Buddyboss spend on their services. This is not due to the ineptitude of a developer, but simply due to the fact that it's not the primary focus of the developer. He is not being paid for his plugin, and you've got to make a living. If you're just one developer, you also run another risk: you have to do everything. PHP vulnerabilities, support requests, etc...it can be very tough. Imagine making a product - anything - that you give to the public for free; however you are acting in a similar position to a CEO of a business - it's no wonder a lot of independant developers stop supporting their plugins after a while.

The downside to this is that a lot of these plugins are expensive, especially if you're starting out. While you can monetize your site, it takes time to get money back - as you're not likely to have many frequent visitors from the go. Furthermore, you need to pay for hosting and a domain name AND keep on top of your job - it can all be a bit much (for those that build websites for a living and are reading this post, I apologise).

# Part 2 of "Constructing a social network" coming 25th February 2020.
Have a cookie while you wait.

Maybe a few cookies would be good.

But we've just hit the nail on the head - 

> "You're not likely to have many frequent visitors from the go

You need to determine what your

# Bootstrap

# A quick word about Dashboards


###### Image credit
* [Wordpress.org Infographic](https://www.wpexplorer.com/wp-content/uploads/wordpress-com-vs-org-infographic.png)
* [Cover art](https://socialengineindia.com/blog/wp-content/uploads/2019/01/social-networking-service.jpg)
* [Buddypress Global Search](https://blog.hubspot.com/hs-fs/hubfs/Imported_Blog_Media/BuddyPress-Global-Search-2.png?width=1300&height=900&name=BuddyPress-Global-Search-2.png)
