import turtle # imports the "turtle" function and asset set, which draws objects on the gameboard



# Gameboard
wn = turtle.Screen() # Utilises Python to create a screen
wn.title("Pong by ACORD") # Sets the title of the menu bar
wn.bgcolor("black") # sets the background colour to black
wn.setup(width=800, height=600) # sets the game window to 800px wide and 600px tall
wn.tracer(0)



# Paddle A
paddle_a = turtle.Turtle()
paddle_a.speed(0) # Sets the initial value of the speed for paddle_a to 0
paddle_a.shape("square") # this sets the dimensions to 20px*20px, which is too small (see line #15)
paddle_a.color("white")
paddle_a.shapesize(stretch_wid=5, stretch_len=1) # Resizes the paddle
paddle_a.penup()
paddle_a.goto(-350, 0) # sets the coords for the original position for "paddle_a"



# Paddle B
paddle_b = turtle.Turtle()
paddle_b.speed(0) # Sets the initial value of the speed for paddle_b to 0
paddle_b.shape("square") # this sets the dimensions to 20px*20px, which is too small (see line #15)
paddle_b.color("white")
paddle_b.shapesize(stretch_wid=5, stretch_len=1) # Resizes the paddle
paddle_b.penup()
paddle_b.goto(350, 0) # sets the coords for the original position for "paddle_b"



# Ball
ball = turtle.Turtle()
ball.speed(0) # Sets the initial value of the speed for ball to 0
ball.shape("square") # this sets the dimensions to 20px*20px, which is too small (see line #15)
ball.color("white")
ball.penup()
ball.goto(0, 0) # sets the coords for the original position for "ball"

# Moving the paddles


# Functions
# Moving the paddles
def paddle_a_up(): # defining function
    y = paddle_a.ycor # finding and defining the y coord for paddle_a
    y += 20
    paddle_a.sety(y)
# Key Binding
wn.listen()
wn.onkeypress(paddle_a_up, "w")



# Main Game Loop
while True:
    wn.update()
