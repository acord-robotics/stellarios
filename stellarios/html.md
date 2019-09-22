# Software Engineering - HTML
[Back to Star Sailors](http://acord-robotics.github.io/starsailors/acord/)

<iframe src="https://docs.google.com/document/d/e/2PACX-1vQ1gNSCghxex2ZzcwSJiM7APBb8G9emuwKlKq7WNMA7BTuyW6CqmCcU6xkKgEQu5butabBOwPcV1YQY/pub?embedded=true"></iframe>

HTML Basics
FROM SOLOLEARN
Paragraphs
To create a paragraph, type in the <p> tag
<html>
<head></head>
<body>
    <p>This is a paragraph</p>
</body>
</html>

Single line break
Use the <br/> tag to add a single line of text without starting a new paragraph
<html>
<head></head>
<body>
        <p>This is a regular paragraph</p>
        <p>This has a <br /> line break</p>
</body
</html>

Text Formatting
In HTML, there is a list of elements that specify text style
Formatting elements were designed to display special types of text
<p>Regular text</p>
<p><b>Bold text</b></p>
<p><big>Big text</big></p>
<p><i>Italic text</i></p>
<p><small>Small text</small></p>
<p><strong>Strong text</strong></p>
<p><sub>Subscripted text</sub></p>
<p></sup>Superscripted text</sup></p>
<p><ins>Inserted text</ins></p>
<p><del>Deleted text</del></p>
Headings, lines and comments
HTML includes six levels of headings - 
H1
H2
H3
H4
H5
H6
Headings are part of body, no need for paragraph tag
To create a horizontal line, use the <hr /> tag
The browser does not display comments, but they add reminders and descriptions on the file

<!-- Your comment goes here →

HTML Elements
HTML documents are made up of HTML elements
An HTML element is written with a start tag and an end tag, with the content in between
HTML documents consist of nested elements
Some elements are quite small
Since you can’t put contents within a break tag, and you don’t have an opening and closing break tag, it’s a separate, single element

<html>
<head>
    <title>First page</title>
</head>
<body>
    <p>This is a paragraph</p>
    <p>This is a <br /> line break</p>
</body>
</html>
    
Attributes
Attributes provide additional information about an element or tag, while also modifying them
Most attributes have a value, the value modifies the attribute
<p>align="center">
    This text is aligned to the center
</p>

Attribute measurements
As an example, we can modify the horizontal line so it has a width of 50 pixels
This can be done by using the width attribute
Width can also be changed by using a percentage (%)

<hr width="50px"/>

Align attribute
Used to specify how text is aligned

<html>
    <head>
        <title>Align attribute</title>
    </head>
    <body>
        <p align="center">This is text<br />
            <hr width="10%" align="right" /> This is also text
        </p>
    </body>
</html>

Images
The <img> tag
The <img> tag can be used to insert an image
It contains only attributes and does not have a closing tag
The image’s url (address) can be defined using the src attribute

<img src="image.jpg” />

Image location
You need to put in the image location for the src attribute between the quotation marks

Image resizing
To define image size, use the width and height attributes
Pixels or percentage

<html>
    <head>
        <title>Image resizing</title>
    </head>
    <body>
        <img src="tree.jpg" height="150px" width="150px" alt="" />
              <!-- or -->
              <img src="tree.jpg" height="50%" width="50%" alt="" />
      </body>
</html>

Image border
By default, an image has no border
Use the border attribute within the image tag to create a border around the image

<img src="tree.jpg" height="150px" width="63%" border="1px" alt=""" />

Links
The <a> tag
Links are an integral part of every web page
You can add links to text or images that will enable the user to click on them in order to be directed to another file or webpage
Use the href attribute to define the link’s destination address
Between the link and the close tag write the link’s text (doesn’t work with images)

<a href="allianceofdroids.org.au/aod">AoD</a>


Lines
HTML Ordered Lists
An ordered list starts with the <ol> tag, and each list item is defined by the <li> tag
Unordered list: <ul>

<html>
    <head>
        <title>Ordered Lists</title>
    </head>
    <body>
        <ol>
               <li>Red</li>
               <li>Blue</li>
                <li>Green</li>
              </ol>  
    </body>
</html>

Tables
Creating a table
Tables are defined using the <table> tag
Tables are divided into rows with the <tr> tag
Columns (table data) - <td> tag

<table>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>

The border and colspan attributes
A border can be added using the border attribute

<table border="2">

A table cell can span two or more columns

<table border="2">
   <tr>
      <td>Red</td>
      <td>Blue</td>
      <td>Green</td>
   </tr>
   <tr>
      <td><br /></td>
      <td colspan="2"><br /></td>
   </tr>
</table>

Colspan Colour
<table border="2">
   <tr>
      <td>Red</td>
      <td>Blue</td>
      <td>Green</td>
   </tr>
   <tr>
      <td>Yellow</td>
      <td colspan="2">Orange</td>
   </tr>
</table>

Bgcolor
Inline and block elements
Types of elements
In HTML most elements are defined as block level or inline elements
Block level elements start from a new line
<h1-h6>
<form>
<li>
<ol>
Etc.
Inline elements - displayed without line breaks
<b>
<a>
<strong>
Etc
The <div> element is a block-level element that is often used as a container for other HTML elements
When used together with some CSS styling, the <div> element can be used to style blocks of content

<html>
  <body>
    <h1>Headline</h1>
    <div style="background-color:green; color:white; padding:20px;">
      <p>Some paragraph text goes here.</p>
      <p>Another paragraph goes here.</p>
    </div>
  </body>
</html>

Types of elements
Other elements can be used either as block level or inline elements
This includes the following elements:
APPLET - embedded JAVA applet
IFRAME - inline frame
INS - Inserted text
MAP - image map
OBJECT - embedded object
SCRIPT - script within an HTML document

Forms
The <form> element
HTML forms are used to collect information from the user
Forms are defined using the <form> tag

<body>
    <form>....</form>
</body

Form action - link that the page will direct the user to after completing the form


<form action="http://www.sololearn.com"> 
</form>

The method and name attributes
Method attribute specifies the HTTP method (GET or POST) to be used when forms are submitted
GET - form data visible in the page address
POST - form is updating data, includes sensitive information, better security
Because the submitted data is not visible in the page address
To take in user input, you need the corresponding form elements such as text fields
The <input> element has many variations, depending on the type attribute. It can be a text, password, radio, URL, submit, etc. 

<form>
   <input type="text" name="username" /><br />
   <input type="password" name="password" />
</form>

If we change the input type to radio, it allows the user select only one of a number of choices:

<input type="radio" name="gender" value="male" /> Male <br />
<input type="radio" name="gender" value="female" /> Female <br />

The submit button submits a form to its action attribute:

<input type="submit" value="Submit" /> 

HTML Colors
Expressed as hexadecimal values
0
1
2
3
3
4
5
6
7
8
9
0
A
B
C
D
E
F
Colours are displayed in combinations of red, green and blue (RGB)
Hex values are written with # followed by 3 or 6 numbers
16 million combinations
Bgcolor  - web page’s background colour

<html>
   <head> 
      <title>first page</title>  
   </head>
   <body bgcolor="#000099">
       <h1>
        <font color="#FFFFFF"> White headline </font>
       </h1> 
   </body>
</html>

Frames
The <frame> tag
A page can be divided into frames by using a special frame document
The <frame> tag defines one specific window (frame) within a <frameset>
Each <frame> in a <frameset> can have different attributes, such as border, scrolling, ability to resize, etc
The <frameset> element specifies the number of columns or rows in the frameset, as well as what percentage or number of pixels of space each of them occupies.
<frameset> not supported __> html5

<frameset cols="100, 25%, *"></frameset>
<frameset rows="100, 25%, *"></frameset>

Working with Frames
Use the <noresize> attribute to specify that a user cannot resize a <frame> element

<frame noresize="noresize">

Frame content should be defined using the src attribute.

Lastly, the <noframes> element provides a way for browsers that do not support frames to view the page. The element can contain an alternative page, complete with a body tag and any other elements.


<frameset cols="25%,50%,25%">
   <frame src="a.htm" />
   <frame src="b.htm" />
   <frame src="c.htm" />
   <noframes>Frames not supported!</noframes>
</frameset>

HTML5
Introduction to HTML5
When writing HTML5 documents, one of the first new features is the doctype declaration

<!DOCTYPE HTML>

The character encoding (charset) declaration is also simplified:

<meta charset="UTF-8">

NEW IN HTML5
New in HTML5

Forms
- The Web Forms 2.0 specification allows for creation of more powerful forms and more compelling user experiences.
- Date pickers, color pickers, and numeric stepper controls have been added.
- Input field types now include email, search, and URL.
- PUT and DELETE form methods are now supported.

Integrated API (Application Programming Interfaces) 
- Drag and Drop
- Audio and Video
- Offline Web Applications
- History
- Local Storage
- Geolocation
- Web Messaging

Content Models
List of content models
In HTML, elements typically belonged in either the block level or inline content model
HTML5 introduces 7 main content models
Metadata - Content that sets up the presentation or behaviour of the rest of the content
Found in the head of the document
Base, Link, meta, noscript, script, style, title
Embedded - Content that imports other resources into the document
Audio, video, canvas, iframe, img, math, object, svg
Interactive - Content specifically intended for user interaction
<a>, <audio>, <video>, <button>, <details>, <embed>, <iframe>, <img>, <input>, <label>, <object>, <select>, <textarea>
Heading - Defines a section header
H1, h2, h3, h4, h5, h6, hgroup
Phrasing -  This model has a number of inline level elements in common with HTML4.
<img>, <span>, <strong>, <label>, <br />, <small>, <sub>
Flow - Contains the majority of HTML5 elements that would be included in the normal flow of the document.
Sectioning - Defines the scope of headings, content, navigation, and footers
<article>, <aside>, <nav>, <section>

HTML5 page structure
<header>
<nav>
<article>
<section>
<section>
<aside>
<footer>

Header, Nav & Footer
The <header> element
In HTML5, a simple <header> tag is used, unlike in HTML4 - <div id=”header”>
Used in the <body> tag

<!DOCTYPE html>
<html>
   <head></head>
   <body>
      <header>
        <h1> Most important heading </h1>
        <h3> Less important heading </h3>
      </header>
   </body>
</html>

The <footer> element
Widely used
Very bottom of web page (generally)

<footer>...</footer>

The <nav> element
Section of a page that links to other pages or sections within the page

<nav>
   <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">About us</a></li>
   </ul>
</nav>


Article, Section & Aside
The <article> element
Article is a self-contained, independent piece of content that can be used and distributed separately from the rest of the page or site. 
This could be a forum post, a magazine or newspaper article, a blog entry, a comment, an interactive widget or gadget, or any other independent piece of content. 
The <article> element replaces the <div> element that was widely used in HTML4, along with an id or class.

<article> 
   <h1>The article title</h1> 
   <p>Contents of the article element </p>
</article>

The <section> element
<section> is a logical container of the page or article. 
Sections can be used to divide up content within an article. 
For example, a homepage could have a section for introducing the company, another for news items, and still another for contact information.
Each <section> should be identified, typically by including a heading (h1-h6 element) as a child of the <section> element.

<article>
  <h1>Welcome</h1>
  <section>
   <h1>Heading</h1>
  <p>content or image</p>
   </section>
</article>

The <aside> element
<aside> is secondary or tangential content which could be considered separate from but indirectly related to the main content.
This type of content is often represented in sidebars.
When an <aside> tag is used within an <article> tag, the content of the <aside> should be specifically related to that article.
<article>
   <h1> Gifts for everyone </h1>
   <p> This website will be the best place for choosing gifts </p>
   <aside>
      <p> Gifts will be delivered to you within 24 hours </p>
   </aside>
</article>

The Audio Element
Audio on the web
Before HTML5, there was no standard for playing audio files on a web page.
The HTML5 <audio> element specifies a standard for embedding audio in a web page.

There are two different ways to specify the audio source file's URL. The first uses the source attribute:

<audio src="audio.mp3" controls>
   Audio element not supported by your browser
</audio>
Try It Yourself

The second way uses the <source> element inside the <audio> element:

<audio controls>
   <source src="audio.mp3" type="audio/mpeg">
   <source src="audio.ogg" type="audio/ogg">
</audio>

The <audio> element creates an audio player inside the browser.

<audio controls>
   <source src="audio.mp3" type="audio/mpeg">
   <source src="audio.ogg" type="audio/ogg">
   Audio element not supported by your browser. 
</audio>

Attributes of <audio>
Controls
Specifies that audio controls should be displayed (such as a play/pause button, etc.)

Autoplay
When this attribute is defined, audio starts playing as soon as it is ready, without asking for the visitor's permission.

<audio controls autoplay>


Loop

This attribute is used to have the audio replay every time it is finished.
<audio controls autoplay loop>

The Video Element
The video element is similar to the audio element. 
You can specify the video source URL using an attribute in a video element, or using source elements inside the video element:

<video controls>
   <source src="video.mp4" type="video/mp4">
   <source src="video.ogg" type="video/ogg">
   Video is not supported by your browser
</video>

Attributes of <video>
Another aspect shared by both the audio and the video elements is that each has controls, autoplay and loop attributes. 

In this example, the video will replay after it finishes playing:


<video controls autoplay loop>
   <source src="video.mp4" type="video/mp4">
   <source src="video.ogg" type="video/ogg">
   Video is not supported by your browser
</video>

The progress element
Progress bar

The <progress> element provides the ability to create progress bars on the web.
The progress element can be used within headings, paragraphs, or anywhere else in the body.

Progress Element Attributes
Value: Specifies how much of the task has been completed. 
Max: Specifies how much work the task requires in total.

Status: <progress min="0" max="100" value="35">
</progress>

Web Storage API
HTML5 Web Storage
With HTML5 web storage, websites can store data on a user's local computer. 
Before HTML5, we had to use JavaScript cookies to achieve this functionality. 

The Advantages of Web Storage
- More secure
- Faster
- Stores a larger amount of data
- Stored data is not sent with every server request

Types of web storage objects
There are two types of web storage objects:
- sessionStorage()
- localStorage()

Local vs. Session
- Session Storage is destroyed once the user closes the browser
- Local Storage stores data with no expiration date

Working with values
The syntax for web storage for both local and session storage is very simple and similar.
The data is stored as key/value pairs.

Storing a Value:
localStorage.setItem("key1", "value1");

Getting a Value:
//this will print the value
alert(localStorage.getItem("key1")); 

Removing a Value:
localStorage.removeItem("key1");

Removing All Values:
localStorage.clear();

Geolocation API

In HTML5, the Geolocation API is used to obtain the user's geographical location.

Since this can compromise user privacy, the option is not available unless the user approves it.


The Geolocation API’s main method is getCurrentPosition, which retrieves the current geographic location of the user's device.
navigator.geolocation.getCurrentPosition();

Parameters:
showLocation (mandatory): Defines the callback method that retrieves location information.
ErrorHandler(optional): Defines the callback method that is invoked when an error occurs in processing the asynchronous call.
Options (optional): Defines a set of options for retrieving the location information.

User location can be presented in two ways: Geodetic and Civic.

1. The geodetic way to describe position refers directly to latitude and longitude.
2. The civic representation of location data is presented in a format that is more easily read and understood by the average person.

Each parameter has both a geodetic and a civic representation:

Drag&Drop API
The drag and drop feature lets you "grab" an object and drag it to a different location.
To make an element draggable, just set the draggable attribute to true:
<img draggable="true" />

Any HTML element can be draggable.

The API for HTML5 drag and drop is event-based.

Example:
<!DOCTYPE HTML>
<html>
   <head>
   <script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
   </script>
   </head>
<body>

   <div id="box" ondrop="drop(event)"
   ondragover="allowDrop(event)"
   style="border:1px solid black; 
   width:200px; height:200px"></div>

   <img id="image" src="sample.jpg" draggable="true"
   ondragstart="drag(event)" width="150" height="50" alt="" />

</body>
</html>

What to Drag
When the element is dragged, the ondragstart attribute calls a function, drag(event), which specifies what data is to be dragged.
The dataTransfer.setData() method sets the data type and the value of the dragged data:
function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

In our example, the data type is "text" and the value is the ID of the draggable element ("image").

Where to Drop
The ondragover event specifies where the dragged data can be dropped. By default, data and elements cannot be dropped in other elements. To allow a drop, we must prevent the default handling of the element.
This is done by calling the event.preventDefault() method for the ondragover event.

Do the Drop
When the dragged data is dropped, a drop event occurs.
In the example above, the ondrop attribute calls a function, drop(event):
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}

The preventDefault() method prevents the browser's default handling of the data (default is open as link on drop).
The dragged data can be accessed with the dataTransfer.getData() method. This method will return any data that was set to the same type in the setData() method.
The dragged data is the ID of the dragged element ("image").

At the end, the dragged element is appended into the drop element, using the appendChild() function.








SVG
Drawing shapes
SVG stands for Scalable Vector Graphics, and is used to draw shapes with HTML-style markup.

It offers several methods for drawing paths, boxes, circles, text, and graphic images. 
Inserting SVG images
Inserting SVG Images

An SVG image can be added to HTML code with just a basic image tag that includes a source attribute pointing to the image:
<img src="image.svg" alt="" height="300" />

Drawing a Circle

To draw shapes with SVG, you first need to create an SVG element tag with two attributes: width and height.
<svg width="1000" height="1000"></svg>

To create a circle, add a <circle> tag:
<svg width="2000" height="2000">
   <circle cx="80" cy="80" r="50" fill="green" />
</svg>
Try It Yourself

- cx pushes the center of the circle further to the right of the screen
- cy pushes the center of the circle further down from the top of the screen
- r defines the radius
- fill determines the color of our circle
- stroke adds an outline to the circle

Other shape elements
<rect> defines a rectangle:
<svg width="2000" height="2000">
   <rect width="300" height="100" 
     x="20" y="20" fill="green" />
</svg>
Try It Yourself

The following code will draw a green-filled rectangle.
<line> defines a line segment:
<svg width="400" height="410">
    <line x1="10" y1="10" x2="200" y2="100" 
        style="stroke:#000000; stroke-linecap:round; 
        stroke-width:20"  />
</svg>
Try It Yourself

(x1, y1) define the start coordinates(x2, y2) define the end coordinates.
<polyline> defines shapes built from multiple line definitions:
<svg width="2000" height="500">
    <polyline style="stroke-linejoin:miter; stroke:black; 
        stroke-width:12; fill: none;"
        points="100 100, 150 150, 200 100" />
</svg>
Try It Yourself

Points are the polyline's coordinates.
The code below will draw a black check sign:

Elipse & Polygon
Ellipse
The <ellipse> is similar to the <circle>, with one exception: 
You can independently change the horizontal and vertical axes of its radius, using the rx and ry attributes.
<svg height="500" width="1000">
   <ellipse cx="200" cy="100" rx="150" ry="70" style="fill:green" />
</svg>
Try It Yourself

Result:



Polygon 
The <polygon> element is used to create a graphic with at least three sides. The polygon element is unique because it automatically closes off the shape for you.
<svg width="2000" height="2000">
<polygon points="100 100, 200 200, 300 0" 
      style="fill: green; stroke:black;" />
</svg>

SVG Animations & Paths
Shape animations
SVG animations can be created using the <animate> element. 

The example below creates a rectangle that will change its position in 3 seconds and will then repeat the animation twice:
<svg width="1000" height="250">
<rect width="150" height="150" fill="orange">
  <animate attributeName="x" from="0" to="300"
    dur="3s" fill="freeze" repeatCount="2"/> 
</rect>
</svg>
Try It Yourself

attributeName: Specifies which attribute will be affected by the animation
from: Specifies the starting value of the attribute
to: Specifies the ending value of the attribute
dur: Specifies how long the animation runs (duration)
fill: Specifies whether or not the attribute's value should return to its initial value when the animation is finished (Values: "remove" resets the value; "freeze" keeps the “to value”)
repeatCount: Specifies the repeat count of the animation

In the example above, the rectangle changes its x attribute from 0 to 300 in 3 seconds.

Paths
The <path> element is used to define a path.

The following commands are available for path data:
M: moveto
L: lineto
H: horizontal lineto
V: vertical lineto
C: curveto
S: smooth curveto
Q: quadratic Bézier curve
T: smooth quadratic Bézier curveto
A: elliptical Arc
Z: closepath

Define a path using the d attribute:
<svg width="500" height="500">
<path d="M 0 0 L200 200 L200 0 Z" style="stroke:#000;  fill:none;" />
</svg>

Canvas
The HTML canvas is used to draw graphics that include everything from simple lines to complex graphic objects.

The <canvas> element is defined by:
<canvas id="canvas1" width="200" height="100">
</canvas>

The <canvas> element is only a container for graphics. You must use a script to actually draw the graphics (usually JavaScript).

The <canvas> element must have an id attribute so it can be referred to by JavaScript:
<html>
   <head></head>
   <body>
     <canvas id="canvas1" 
   width="400" height="300"></canvas> 

   <script>
      var can = document.getElementById("canvas1"); 
      var ctx = can.getContext("2d");
   </script>

   </body>
</html>

getContext() returns a drawing context on the canvas

Canvas coordinates

The HTML canvas is a two-dimensional grid.
The upper-left corner of the canvas has the coordinates (0,0).

X coordinate increases to the right.
Y coordinate increases toward the bottom of the canvas.




Drawing shapes
The fillRect(x, y, w, h) method draws a "filled" rectangle, in which w indicates width and h indicates height. The default fill color is black. 

A black 100*100 pixel rectangle is drawn on the canvas at the position (20, 20):
var c=document.getElementById("canvas1");
var ctx=c.getContext("2d");
ctx.fillRect(20,20,100,100);
Try It Yourself

Result:


The fillStyle property is used to set a color, gradient, or pattern to fill the drawing.
Using this property allows you to draw a green-filled rectangle.
var canvas=document.getElementById("canvas1");
var ctx=canvas.getContext("2d");
ctx.fillStyle ="rgba(0, 200, 0, 1)";
ctx.fillRect (36, 10, 22, 22);
Try It Yourself

Result:


The canvas supports various other methods for drawing:

Draw a Line
moveTo(x,y): Defines the starting point of the line.
lineTo(x,y): Defines the ending point of the line.

Draw a Circle
beginPath(): Starts the drawing.
arc(x,y,r,start,stop): Sets the parameters of the circle.
stroke(): Ends the drawing.

Gradients
createLinearGradient(x,y,x1,y1): Creates a linear gradient.
createRadialGradient(x,y,r,x1,y1,r1): Creates a radial/circular gradient.

Drawing Text on the Canvas
Font: Defines the font properties for the text.
fillText(text,x,y): Draws "filled" text on the canvas.
strokeText(text,x,y): Draws text on the canvas (no fill

SVG vs canvas
Canvas
- Elements are drawn programmatically
- Drawing is done with pixels
- Animations are not built in
- High performance for pixels-based drawing operations
- Resolution dependent
- No support for event handlers
- You can save the resulting image as .png or .jpg
- Well suited for graphic-intensive games

SVG
- Elements are part of the page's DOM (Document object model)
- Drawing is done with vectors
- Effects, such as animations are built in
- Based on standard XML syntax, which provides better accessibility
- Resolution independent
- Support for event handlers
- Not suited for game applications
- Best suited for applications with large rendering areas (for example, Google Maps)

Canvas Transformations
Working with canvas
he Canvas element can be transformed. As an example, a text is written on the canvas at the coordinates (10, 30).
ctx.font="bold 22px Tahoma";
ctx.textAlign="start";
ctx.fillText("start", 10, 30);
Try It Yourself

Result:


The translate(x,y) method is used to move the Canvas.
x indicates how far to move the grid horizontally, and y indicates how far to move the grid vertically.
ctx.translate(100, 150);
ctx.fillText("after translate", 10, 30);



Rotate method
The rotate() method is used to rotate the HTML5 Canvas. The value must be in radians, not degrees.

Here is an example that draws the same rectangle before and after rotation is set:
ctx.fillStyle = "#FF0000";
ctx.fillRect(10,10, 100, 100);

ctx.rotate( (Math.PI / 180) * 25);  //rotate 25 degrees.

ctx.fillStyle = "#0000FF";
ctx.fillRect(10,10, 100, 100);

Scale method
The scale() method scales the current drawing. It takes two parameters:
- The number of times by which the image should be scaled in the X-direction.
- The number of times by which the image should be scaled in the Y-direction.
var canvas = document.getElementById('canvas1');
ctx =canvas.getContext('2d');
ctx.font="bold 22px Tahoma";
ctx.textAlign="start";
ctx.fillText("start", 10, 30);
ctx.translate(100, 150);
ctx.fillText("after translate", 0, 0);
ctx.rotate(1);
ctx.fillText("after rotate", 0, 0);
ctx.scale(1.5, 4);
ctx.fillText("after scale", 0,20);

HTML5 forms, part 1
HTML5 brings many features and improvements to web form creation. There are new attributes and input types that were introduced to help create better experiences for web users.

Form creation is done in HTML5 the same way as it was in HTML4:
<form>
   <label>Your name:</label>
   <input id="user" name="username" type="text" />
</form>
New attributes
HTML5 has introduced a new attribute called placeholder. On <input> and <textarea> elements, this attribute provides a hint to the user of what information can be entered into the field.
<form>
   <label for="email">Your e-mail address: </label> 
   <input type="text" name="email" placeholder="email@example.com" /> 
</form>
Try It Yourself

Result:


The autofocus attribute makes the desired input focus when the form loads:
<form>
   <label for="e-mail">Your e-mail address: </label> 
   <input type="text" name="email" autofocus/>
</form>

Forms with required fields
The "required" attribute is used to make the input elements required.
<form autocomplete="off">
   <label for="e-mail">Your e-mail address: </label>
   <input name="Email" type="text" required />
   <input type="submit" value="Submit"/>
</form>
Try It Yourself

The form will not be submitted without filling in the required fields.

Result:


The autocomplete attribute specifies whether a form or input field should have autocomplete turned on or off.
When autocomplete is on, the browser automatically complete values based on values that the user has entered before.


HTML5 added several new input types:
- color
- date
- datetime
- datetime-local
- email
- month
- number
- range
- search
- tel
- time
- url
- week

New input attributes in HTML5:
- autofocus
- form
- formaction
- formenctype
- formmethod
- formnovalidate
- formtarget
- height and width
- list
- min and max
- multiple
- pattern (regexp)
- placeholder
- required
- step

HTML5 forms, part 2
Creating a search box
The new search input type can be used to create a search box:
<input id="mysearch" name="searchitem" type="search" />
Search options
The <datalist> tag can be used to define a list of pre-defined options for the search field:
<input id="car" type="text" list="colors" />
<datalist id="colors">
   <option value="Red">
   <option value="Green">
   <option value="Yellow">
</datalist>

Creating more fields
Some other new input types include email, url, and tel:
<input id="email" name="email" type="email" placeholder="example@example.com" />
<br />
<input id="url" name="url" type="url" placeholder="example.com" />
<br />
<input id="tel" name="tel" type="tel" placeholder="555.555.1211" />
Try It Yourself

These are especially useful when opening a page on a modern mobile device, which recognizes the input types and opens a corresponding keyboard matching the field's type:
