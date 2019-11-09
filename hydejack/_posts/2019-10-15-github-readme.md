---
title: Write a perfect Github Readme
image: /assets/img/blog/star-wars-cyberpunk-ap.jpg
description: >
  Originally published on the ACORD Portal & Dev.to, updated by Liam Arbuckle. Arguably the single most important piece of documentation for any open source project is the README. A good README not only informs people what the project does but also who is it for, how they can install and use it and how they can contribute to it.
published: true
---


Originally published: https://dev.to/scottydocs/how-to-write-a-kickass-readme-5af9?utm_source=digest_mailer&utm_medium=email&utm_campaign=digest_email
Originally published: http://allianceofdroids.org.au/aod/2019/11/01/github-readme-tutorial/

Arguably the single most important piece of documentation for any open source project is the README. A good README not only informs people what the project does but also who is it for, how they can install and use it and how they can contribute to it.

If you write a bad README without sufficient explanation of what your project does or how people can use it then it pretty much defeats the purpose of being open source as other developers are less likely to engage with or contribute towards it.

TL;DR – Too long? Skip to the end and use my template

# What is a README?
Essentially a README is a single text (.txt or .md) file that acts as the one-stop shop documentation for a project or directory. It is usually the most visible piece of documentation and landing page for most open source projects. Even a README file’s name in all-caps will catch your readers attention and ensure it is the first thing they read.

There’s evidence that READMEs date back as far as the 1970s. The oldest example I could find was this README for DEC’s PDP-10 computer which is dated 27th November 1974. Although the origin of the name README is disputed, the two most popular theories are:

Programmers of the original mainframe computers which came with punch cards, would leave a stack paper of instructions with “READ ME!” written across the front.
The name is a nod to Lewis Carroll’s Alice in Wonderland in which the main character Alice finds a bottle of potion labelled “DRINK ME” and cake labelled “EAT ME” which make her change in size.
What should you include in a README?
Ok, so what should an awesome README file contain? As a starting point, I would recommend you include the following key things:

1. Name the thing
Don’t forget to give your project or feature a name. There are a surprising number of projects on GitHub that don’t have a name.

2. An introduction or summary
Write a short two or three line introduction explaining what your project does and who it is for. Also leave out headings like ‘Introduction’, ‘Summary’ or ‘Overview’ – it’s obvious this is an introduction.

3. Prerequisites
Immediately after your introduction add a section titled listing any prerequisite knowledge or tools anyone who wants to use the project might need before they begin. For example, if it runs on the latest version of Python, tell them to install Python. Here’s an example:
Prerequisites

Before you continue, ensure you meet the following requirements:

* You have installed the latest version of Ruby.
* You are using a Linux or Mac OS machine. Windows is not currently supported.
* You have a basic understanding of graph theory.
4. How to install the thing
Provide installation steps! It’s amazing how many projects I’ve come across that only provide basic usage instructions and expect you to magically know how to install it. Make sure to break the installation down into numbered steps if it requires multiple steps.

5. How to use the thing
Add steps for how to use the project once the user has installed it. Make sure to include usage examples and a reference explaining command options or flags if you think they will be helpful. If you have more advanced documentation in a separate file or site, link to this from here.

6. How to contribute to the thing
You might want to create a contributor’s guide in a separate file but definitely link to this from your README if you want people to read it before contributing pull requests to your project.

7. Add contributors
Credit any contributors who have helped with the project in an author section. It’s a nice way to make open source feel like a team effort and acknowledges everyone who has taking the time to contribute.

8. Add acknowledgements
Similarly, if you have used anyone else’s work (code, designs, images etc) that has a copyright that requires acknowledgement, you might want to add that here. You can also acknowledge any other developers or institutions who helped with the project.

9. Contact information
You might not want to do this is you’re an extremely private person but if someone has questions, wants to collaborate with you or is impressed enough with your project to offer you a job opportunity, it makes sense to have your contact details front and centre.

10. Add licence information
You definitely want to include licence information if applicable. Startups and other companies who rely on third-party software are unlikely to be able to use your project unless you provide this. See opensource.org for a list of licences you may be able to use.

Add flare to your README 🔥
If you really want to make your README stand out and look visually appealing you can do things like:

Add a logo: If your project has a logo, add this at the top of your README. Branding makes a project looks more professional and helps people remember it.
Add badges or shields: You can add badges and shields to reflect the current status of the project, the licence it uses and if any dependencies it uses are up-to-date. Plus they look pretty cool! You can find a list of badges or design your own at Shields.io.
Add screenshots: Sometimes a simple screenshot or set of screenshots can say far more than a thousand words. Be warned though, if you do use screenshots you will need to update them each time you update your project.
Use emojis?: A lot of projects seem to use emojis these days, although it’s up to you whether you want to use them. They can be a good way to inject a bit colour and humour into your README and makes the project feel a bit more human.
If you’re using All Contributors to acknowledge contributions, you could use their emoji key to denote different contributions types:

* 🐛 for raising a bug
* 💻 for submitting code
* 📖 for docs contributions etc.
This is what GitHub badges or shields look like for reference (No doubt you’ve seen them before!):

Shields.io badges
My template
I’ve created a template that covers most of the recommendations made in this post. Feel free to fork the repository, make suggestions to improve it or customize it for your own purposes! You can find my template on GitHub here.

Resources
If you want more advice on READMEs, I’d also recommend these resources:

Daniel Beck’s talk ‘Write the Readable’ from Write the Docs in 2016.
Lorna Jane Mitchell’s talk ‘Github as a landing page’ from API the Docs 2019.
Check out Franck Abgrall’s README generator.
