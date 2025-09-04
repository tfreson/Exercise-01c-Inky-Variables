/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR coin_Count = 0

-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.



+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. it is dark but you hear some carnal music.
* {torch_pickup} [light torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel_lit==
you find a large room with a few slot machines and a few arcade cabenets.
+{coin_pickup} play slots->slots
+{coin_pickup} play arcade ->arcade
+go back->cave_mouth

==arcade==
->DONE
==slots==
{coin_Count<1} you are broke ->west_tunnel_lit
{coin_Count>1} you put one of your coins in ->play

==play==
coin_Count = coin_Count-1
VAR rand = 0
rand = RANDOM(1,6)
{rand<3} you win   ->win
{rand>2} you lose  ->lose


==win==
coin_Count = coin_Count+3
coins remaining: {coin_Count}
->west_tunnel_lit
==lose==
coins remaining: {coin_Count}
->west_tunnel_lit
=== torch_pickup ===
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of a couple of coins in the room.
*pick up a coin ->coin_pickup
*go back ->cave_mouth


===coin_pickup===
you pick up a coins.
coin_Count=3
->east_tunnel_lit