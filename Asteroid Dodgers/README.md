# Asteroid Dodgers
Asteroid Dodgers is a game created by ACORD in collaboration with [@Orgzy-Design](http://github.com/orgzy-design) (our Chairman's company). It is a slight parody on Star Sailors and is part of the RPG family.

## Development
__What's going on?__
Currently we are working on developing Asteroid Dodgers in the Unity Game Engine. Level 2 is what is being developed, as well as the main menu.

## Level 1
Explore the galaxy and find "alien artifacts"

## Level 2
Bring those artifacts back to your base
## Asteroid Dodgers (aka Unityballs)
Asteroid Dodgers is a game part of Stellarios that is created in Unity. It is actively developed at Github/Acord-Robotics/Unityballs.

### Documentation - SDLC
__State The Problem__
What I want to learn: I want to learn how to create a game for both computers and mobile devices. I want to learn how to code in languages such as C# and C++. I've played games for ages, but mostly science fiction games. I've looked for true space colonization games for years, but until recently I never found any good ones. So, I thought that I should make my own game, and that's what I want to learn. 

Skills I will need: I will need to know how to navigate the Unity interface and I will need to know the C# language. I've only ever created websites before, as I have trouble with understanding the languages used for games such as C# and JavaScript. Last year in Computer Science I created a text-based role-playing game using Python, and Python is a scripting language that I understand well as it is quite logical, and there are only 33 keywords in Python 3 so it is quite easy to understand. I considered creating a game in Python, but as I don't know how to create objects and textures for Python games, the best thing I could have done was a text-based-game, which I don't think is a good representation of my abilities. I used Unity briefly last year in Computer Science as well, and because of my search to find good space games (especially for mobile) and my hopes of learning code, I decided to learn how to use Unity & C#.

The app will be a game that will be available for mobile devices and computers. I intend on making it a game that will primarily entertain younger gamers, as the game will not be on the same level as games that experienced gamers will know. This means that they probably would not get enjoyment out of it, however anyone can play it and there is no real target audience. The needs of the user will be a computer, mouse and keyboard, or a mobile device and their hands, as well as the instructions for the game. The licensing will be open-source, so that everyone can improve the game if they want to and this means that I don't have to look over every proposed change. 

__Project Timeline__
Date	Time	Description
July 7	2 hours	I completed the Roll-A-Ball Tutorial on Unity Tutorials. 
July 7	45 minutes	 I restarted my game, creating a game similar to Roll-A-Ball, but without following the tutorial and without looking at the tutorial I had done
July 8	35 minutes	I added "pickups" to the game - objects for the player to pick up. These had no textures, they were just spinning cubes
July 9	60 minutes	I added a move function to the game.
		{
		        float moveHorizontal = Input.GetAxis("Horizontal");
		        float moveVertical = Input.GetAxis("Vertical");
		
		        Vector3 movement = new Vector3(moveHorizontal, 0.0f, moveVertical);
		
		        if (Input.GetKeyDown(KeyCode.Space))
		        {
		            rb.AddForce(new Vector3(0, 10, 0), ForceMode.Impulse);
		        }
		
		        rb.AddForce(movement * speed); // part of the rigidbody, to make the object (in this case the ball) move faster or slower. To solve the issue of compiling over and over again whenever I change the speed, I'll create a new public variable on line 7
		    }
		
July 10	30 minutes	I added scoring to the game, using this code:
		
		{
		        if (other.gameObject.CompareTag("Pick Up")) // The Pick Up tag needs to be declared in Unity    // Destroy(other.gameObject); With this code, when the player game object touches the "other collider", it will destroy the game object that the trigger is attached to, through the reference "other.gameObject". 
		        {
		            other.gameObject.SetActive(false);
		            count = count + 1; // To display this score, we have created a "UI object - text" in the Unity editor. This also created a canvas and an event system in the hierachy.
		            SetCountText();
		        }
		
		        if (other.gameObject.CompareTag("Asteroid")) // If colliding with a game object that has the tag "Asteroid"....
		        {
		            other.gameObject.SetActive(false); // The asteroid will be set to false (i.e. not visible)
		            count = count - 1; // The player's score will decrease by 1
		            SetCountText(); 
		        }
		
July 13	3 hours	 I restarted and finished the Roll-A-Ball tutorial as when I added scoring it screwed up my move function, which was different to the function seen in the tutorial
July 14	2 hours	I started to deviate from the standard tutorial.  I added "asteroids", which are objects that the player needs to avoid. (I first tried to create the texture and when I couldn't I just went back to using the default texture and turned it into a prefab)
July 17	5 minutes	 I added a script to the asteroids so that they will remove a point from the player's score 
July 18	20 minutes	 I downloaded a sprite/texture from the Unity Asset store - for the spaceship
July 19	2 hours	I resized the playboard, the pick up objects and the asteroids because the spaceship sprite is much bigger than the player
July 23	2 hours	 I added a new move function to the spaceship, which previously could not move. I also added a script so that the scoring would work for the spaceship, which is a separate gameObject to the player (which is disabled). (2 hours, with different scripts now working because of the texture that I downloaded, which was in fact a prefab with custom movement scripts)
		
		{
		        float h = Input.GetAxis("Horizontal") * 5;
		        float v = Input.GetAxis("Vertical") * 5;
		
		        Vector3 vel = rb.velocity;
		
		        vel.x = h;
		        vel.z = v;
		        rb.velocity = vel;
		
		    }
		
July 28	30 minutes	Added time delay after the user completes or loses a level before the scene changes (waitfortime function) 
July 30	25 minutes	Added a new scene for main menu and for level 2 (when you finish level 1, there is a delay of 5 seconds and then it transitions to Level 2)
August 3	30 minutes	Found asteroid sprite/texture from the Unity asset store and added it to the asteroid prefab
August 4	30 minutes	Started documentation
August 6	1 hour	SDLC
August 7	30 minutes	Large and small asteroids added, which take different amounts off your ship's durability
August 7	30 minutes	Ship durability score - previously the asteroids just took points off your score from collecting the pickups. This was a problem as it meant that you may run into too many asteroids and not be able to collect enough pickups to finish the game
August 8	30 minutes (with Mr Musovic)	Trace Table
August 10	45 minutes	Similar apps
Total time	20.75 hours	

__Tracetable - For Scoring__
Line 1	Score <-- 0
Line 2	Repeat
Line 3	Input(movement)
Line 4	     If gameObject collides with pickUp
Line 5	     Score <-- score + 1
Line 6	Until(score == 5)
Line 7	Output("Load Scene 2" after 5 second delay)
	



Line	Score	gameObject collide pickUp	Score = 5	Output
1	 0	 		 
4	 	FALSE	 	 
6	 	 	FALSE	 
5	 0		 	 
4	 	TRUE		 
5	 1	 	 	 
6	 	 	FALSE	 
4		 TRUE	 	 
5	 2		 	 
6	 	 	 FALSE	 
4	 	 TRUE		 
5	3	 	 	 
7	 		 FALSE	 
8	 	 TRUE	 	 
4	 4			 
7	 		 FALSE	 
8	 	TRUE 	 	 
4	 5	 		 
5		 	 TRUE	 
7	 	 	 	Load Level 2

__ Similar apps available
One of the most popular tutorials on Unity is the Roll-A-Ball tutorial, and this is the tutorial that I followed to learn how to use the Unity interface and get the hang of C#. Roll-A-Ball is a small game that involves a 3D ball (game object) that the player controls that attempts to pick up objects (that are named "pickups") on the play field. My game (Asteroid Dodgers) is quite like Roll-A-Ball, however there are things to avoid (namely asteroids) as well as things to pick up, and in the future levels there will be more of an adventure aspect to the game. Roll A Ball is a game that is not very aesthetically pleasing, however it doesn't need to be as the purpose of it is to show the user how to create games in Unity and is not going to be published on Steam or the Google Play Store.

Subway surfers is another game that is similar to my game. Like Asteroid Dodgers, it has things to avoid (trains, barriers and the policeman that is chasing you) as well as things to pick up (coins and powerups). Subway surfers has very cartoon-style graphics, which works as the average demographic for Subway Surfers is the pre-teen range. Subway surfers has an inventory system (for example, the coins that you have picked up) that is linked to your account, as well as a social network aspect that allows you to connect with your friends and try and beat their scores. The game has a scoring total that is linked to how far you have run, so there is a feature that tracks how far the user has run.

Doodle Jump is a popular "arcade-style" game that has been around for around about 10 years. In Doodle Jump, you play as a character that is "drawn" onto a piece of paper. There are obstacles that are drawn onto the paper that you need to avoid, and in some levels (for example the pirate level) there are coins and other objects to collect. It is similar to Subway surfers in that it has an inventory system and will go on forever until the player dies (by running into an obstacle, for example). Both Subway Surfers and Doodle Jump are procedurally generated, which means that unlike my game (Asteroid Dodgers), there is no set map for each level. Instead, each time the game is loaded it puts different platforms (to jump on), collectables and obstacles in random positions according to rules that are set in the code. For example, in Doodle Jump there could be a rule saying that there can't be 2 monsters (obstacles) within 3 meters of each other. This means that when the map in a level is generated, each object is placed randomly but will make sure that it is possible for the user to continue playing without "dying". 

__Remove barriers__
Location	Equipment	Conditions
Home	Table	Free of everything
Library	Library Desk + Charging port	Cleared
Gardham	Notebook, Computer	
All Locations	Computer (Lenovo Yoga 910)	Microsoft Visual Studio Code
		Unity
		Tutorial/Unity cheatsheet
		Everything else closed
All Locations	Headphones/Earphones	Connected
		Ambient music or heavy metal
Home (Using Desktop)	Mouse	Connected, on mousepad
All Locations	Phone	Silent, charging (if at home) or in pocket (at school)

__Pseudocode & Flowchart__


Score <-- 0
Repeat
	Input(Movement)
		If gameObject collides pickUp
		Score <-- Score + 1
Until(score==5)
Output("Load Scene 2" after 5 second delay)


# Asteroid Dodgers

Asteroid Dodgers is a game created by ACORD in collaboration with @Orgzy-Design (our Chairman's company). It is a slight parody on Star Sailors and is part of the RPG family.

# Development

# What's going on? 
Currently we are working on developing Asteroid Dodgers in the Unity Game Engine. Level 2 is what is being developed, as well as the main menu.

# Level 1
Explore the galaxy and find "alien artifacts"

# Level 2

Bring those artifacts back to your base
http://allianceofdroids.org.au/aod/forums/topic/asteroid-dodgers-storyline/
