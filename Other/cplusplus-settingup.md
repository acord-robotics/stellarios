---
layout: about
title: "C++ - Installation"
published: true
---



# C++ Development Map

* [Setting Up](http://acord-robotics.github.io/starsailors/settingup) - What to do to start learning and developing with C++



__Resources__

* [CodeBlocks](https://sourceforge.net/projects/codeblocks/files/Binaries/17.12/Windows/codeblocks-17.12mingw-setup.exe/download) - Integrated Development Environment (Windows)
*  [Visual Studio Code](http://code.visualstudio.com) - Text editor for Windows, by Microsoft



# About

C++, a coding language based off of C, is an incredibly popular language for developers and can be used to develop Windows & Android applications. This page is going to be talking about what I do when I start learning C++, including installing a text editor (I'm using Visual Studio), adding a compiler, etc.



I'd recommend checking out this video here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/vLnPwxZdW4Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>





## Setting up for C++

To create and edit C++ files, we're going to need a text editor. I'm going to be using  [Visual Studio Code](https://code.visualstudio.com/). Any text editor will work, but I'd recommend against using Microsoft Word, or google docs. IDEs (Integrated Development Environments) are good text editors as well.

We're also going to need a compiler - a C++ compiler. What a compiler does is it takes your code, and transforms it into a language that your computer can understand.

### CodeBlocks

[Codeblocks](http://codeblocks.org) is a free and open-source C++ IDE that can run on different platforms (including Windows, which is what I'm using.)

<iframe width="560" height="315" src="https://www.youtube.com/embed/vLnPwxZdW4Y?start=527" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Setup, HelloWorld

When you open Codeblocks, you're going to see an interface that looks like this:

https://pbs.twimg.com/media/D4zaacsWsAAFCak.jpg

We're going to click on the button that says "Create new project." A window will open up, and we'll click "Console". We then select C++ as the language we'll be using, instead of C. I've titled the project "Hello World" and saved it in Github/Acord-robotics/starsailors/stellarios/. After this there's a bunch of options to do with debugging and the compiler, we're just going to leave them how they are at the moment. We click finish, and we're into the project interface. 

Once we've created the project, we see that there is a file called "main.cpp". The .cpp part of the file is the extension that identifies it as a cplusplus project. See this part of the video for more: - https://youtu.be/vLnPwxZdW4Y?t=600. We're going to open this file, and we see that there is a bunch of code already there:

```cpp
#include <iostream>

using namespace std;

int main()
{
    cout << "Hello world!" << endl;
    return 0;
}

```



This part of the program prints out "Hello World":

```cpp
{
    cout << "Hello world!" << endl;
    return 0;
}
```

This part of the program identifies it as a C++ file:

```cpp
#include <iostream>

using namespace std;
```

