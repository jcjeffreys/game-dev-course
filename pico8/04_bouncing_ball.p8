pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- lesson 4: bouncing ball
-- learn about physics and collisions!
--
-- this program teaches you how to
-- create smooth animation and handle
-- collisions with screen edges

-- =============================
-- what you'll learn:
-- =============================
-- 1. velocity (speed and direction)
-- 2. updating position with velocity
-- 3. collision detection with edges
-- 4. bouncing (reversing direction)
-- 5. basic physics simulation

-- =============================
-- global variables
-- =============================

-- ball position
ball_x = 64
ball_y = 64

-- ball velocity (speed in x and y direction)
ball_dx = 2   -- dx = change in x (horizontal speed)
ball_dy = 1.5 -- dy = change in y (vertical speed)

-- ball properties
ball_radius = 4
ball_color = 8  -- red

-- trail effect
trail = {}  -- this will store previous positions

function _init()
  -- initialize ball in center with random direction
  ball_x = 64
  ball_y = 64
  
  -- random starting velocity
  ball_dx = rnd(4) - 2  -- random from -2 to 2
  ball_dy = rnd(4) - 2
  
  -- make sure ball is actually moving
  if abs(ball_dx) < 0.5 then ball_dx = 1 end
  if abs(ball_dy) < 0.5 then ball_dy = 1 end
  
  -- clear trail
  trail = {}
end

function _update()
  -- =============================
  -- update ball position
  -- =============================
  
  -- move ball based on velocity
  ball_x += ball_dx
  ball_y += ball_dy
  
  -- =============================
  -- check for collisions with edges
  -- =============================
  
  -- left and right edges
  if ball_x - ball_radius < 0 then
    ball_x = ball_radius
    ball_dx = -ball_dx  -- reverse horizontal direction
  elseif ball_x + ball_radius > 127 then
    ball_x = 127 - ball_radius
    ball_dx = -ball_dx  -- reverse horizontal direction
  end
  
  -- top and bottom edges
  if ball_y - ball_radius < 0 then
    ball_y = ball_radius
    ball_dy = -ball_dy  -- reverse vertical direction
  elseif ball_y + ball_radius > 127 then
    ball_y = 127 - ball_radius
    ball_dy = -ball_dy  -- reverse vertical direction
  end
  
  -- =============================
  -- add to trail
  -- =============================
  
  -- add current position to trail
  add(trail, {x=ball_x, y=ball_y})
  
  -- keep trail at max 10 positions
  if #trail > 10 then
    deli(trail, 1)  -- remove oldest position
  end
  
  -- =============================
  -- reset with x button
  -- =============================
  
  if btnp(5) then
    _init()
  end
end

function _draw()
  -- clear screen to black
  cls(0)
  
  -- =============================
  -- draw trail
  -- =============================
  
  -- draw trail with fading effect
  for i=1,#trail do
    local t = trail[i]
    -- older trail positions are dimmer
    local fade = i / #trail
    local trail_color = 5 + flr(fade * 3)
    circfill(t.x, t.y, ball_radius-2, trail_color)
  end
  
  -- =============================
  -- draw ball
  -- =============================
  
  -- draw main ball
  circfill(ball_x, ball_y, ball_radius, ball_color)
  
  -- add highlight for 3d effect
  circfill(ball_x-1, ball_y-1, 1, 10)
  
  -- =============================
  -- draw ui
  -- =============================
  
  -- title
  print("bouncing ball", 32, 5, 7)
  
  -- show velocity
  print("dx:"..ball_dx.." dy:"..ball_dy, 5, 5, 7)
  
  -- instructions
  print("press x to reset", 28, 115, 7)
  
  -- draw border
  rect(0, 0, 127, 127, 13)
end

-- =============================
-- understanding velocity:
-- =============================
-- dx (delta x) = change in x per frame
-- dy (delta y) = change in y per frame
--
-- positive dx = moving right
-- negative dx = moving left
-- positive dy = moving down
-- negative dy = moving up
--
-- when ball hits edge, we reverse
-- the direction by negating the velocity:
-- dx = -dx (or dy = -dy)

-- =============================
-- try these experiments:
-- =============================
-- 1. change the initial ball_dx and ball_dy
--    to make it faster or slower
-- 2. change ball_radius to make it bigger/smaller
-- 3. remove the trail code to see ball alone
-- 4. add gravity by adding a small value to
--    ball_dy each frame: ball_dy += 0.1
-- 5. change what happens when ball hits edges
--    (try reducing speed instead of reversing)

-- =============================
-- challenge:
-- =============================
-- 1. add multiple balls bouncing around
-- 2. make the ball change color when it bounces
-- 3. add friction to slow the ball over time
-- 4. make clicking a button add more balls
