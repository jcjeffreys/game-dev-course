pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- lesson 1: hello world
-- your first pico-8 program!
--
-- this program teaches you the
-- three core functions that make
-- up every pico-8 game

-- =============================
-- what you'll learn:
-- =============================
-- 1. the _init() function runs once at startup
-- 2. the _update() function runs 30 times per second
-- 3. the _draw() function runs 30 times per second after _update()
-- 4. how to display text on screen

-- =============================
-- global variables
-- =============================
-- we'll use this to count frames
frame_count = 0

-- =============================
-- _init() function
-- =============================
-- this runs ONCE when the program starts
-- use it to set up your game's initial state

function _init()
  -- we could initialize variables here
  -- for now, we'll just use the default value above
  print("program started!")
end

-- =============================
-- _update() function
-- =============================
-- this runs 30 times per second
-- use it to update game logic, check input, etc.

function _update()
  -- increment our frame counter
  frame_count += 1
  
  -- note: in lua, you can also write:
  -- frame_count = frame_count + 1
end

-- =============================
-- _draw() function
-- =============================
-- this runs 30 times per second, after _update()
-- use it to draw everything on screen

function _draw()
  -- clear the screen to black (color 0)
  cls()
  
  -- print some text at the top of screen
  -- format: print(text, x, y, color)
  -- x and y are optional (default to cursor position)
  print("hello, pico-8!", 30, 10, 7)
  
  -- print more text (color 7 is white)
  print("this is your first", 20, 30, 7)
  print("pico-8 program!", 25, 38, 7)
  
  -- let's display our frame counter
  -- the ".." operator joins strings
  print("frames: "..frame_count, 30, 60, 11)
  
  -- print instructions at bottom
  print("press esc to stop", 22, 110, 13)
end

-- =============================
-- try these experiments:
-- =============================
-- 1. change the colors (try numbers 0-15)
-- 2. change the x and y positions
-- 3. add your own text messages
-- 4. modify what frame_count counts
--    (try counting by 2s or 5s)

-- =============================
-- how to run this:
-- =============================
-- 1. load this file in pico-8
-- 2. type: run
-- 3. press esc to stop
-- 4. type: reboot to clear memory
