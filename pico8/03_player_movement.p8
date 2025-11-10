pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- lesson 3: player movement
-- make your first interactive game!
--
-- this program teaches you how to
-- read input and move a character

-- =============================
-- what you'll learn:
-- =============================
-- 1. reading button input with btn()
-- 2. storing position in variables
-- 3. updating position based on input
-- 4. keeping objects on screen (boundaries)
-- 5. basic game interactivity

-- =============================
-- button constants:
-- =============================
-- 0 = left arrow
-- 1 = right arrow  
-- 2 = up arrow
-- 3 = down arrow
-- 4 = o button (z key)
-- 5 = x button (x key)

-- =============================
-- global variables
-- =============================

-- player position
player_x = 64  -- center of screen (128/2)
player_y = 64  -- center of screen (128/2)

-- player size
player_size = 6

-- player speed (pixels per frame)
player_speed = 2

-- player color
player_color = 11  -- green

function _init()
  -- reset player to center
  player_x = 64
  player_y = 64
end

function _update()
  -- =============================
  -- check for input and move player
  -- =============================
  
  -- check left arrow
  if btn(0) then
    player_x -= player_speed
  end
  
  -- check right arrow
  if btn(1) then
    player_x += player_speed
  end
  
  -- check up arrow
  if btn(2) then
    player_y -= player_speed
  end
  
  -- check down arrow
  if btn(3) then
    player_y += player_speed
  end
  
  -- =============================
  -- keep player on screen
  -- =============================
  
  -- don't go off the left edge
  if player_x < player_size then
    player_x = player_size
  end
  
  -- don't go off the right edge
  if player_x > 127-player_size then
    player_x = 127-player_size
  end
  
  -- don't go off the top edge
  if player_y < player_size then
    player_y = player_size
  end
  
  -- don't go off the bottom edge
  if player_y > 127-player_size then
    player_y = 127-player_size
  end
end

function _draw()
  -- clear screen to dark blue
  cls(1)
  
  -- =============================
  -- draw the player
  -- =============================
  
  -- draw player as a filled circle
  circfill(player_x, player_y, player_size, player_color)
  
  -- add a small highlight to make it look 3d
  circfill(player_x-2, player_y-2, 2, 7)
  
  -- =============================
  -- draw ui / instructions
  -- =============================
  
  -- title
  print("player movement", 28, 5, 7)
  
  -- instructions
  print("use arrow keys to move", 16, 115, 7)
  
  -- show position (helpful for learning!)
  print("x:"..player_x.." y:"..player_y, 5, 5, 7)
  
  -- draw screen boundaries as a guide
  rect(0, 0, 127, 127, 13)
end

-- =============================
-- try these experiments:
-- =============================
-- 1. change player_speed to make it faster/slower
-- 2. change player_size to make it bigger/smaller
-- 3. change player_color to a different color
-- 4. change the background color in cls()
-- 5. draw a square instead of a circle
--    use: rectfill(player_x-player_size, 
--                  player_y-player_size,
--                  player_x+player_size,
--                  player_y+player_size,
--                  player_color)

-- =============================
-- challenge:
-- =============================
-- 1. make the player leave a trail
--    hint: don't use cls(), or use
--    it with a different color
-- 2. add diagonal movement by checking
--    multiple buttons at once
-- 3. change the player shape based on
--    which direction it's moving
-- 4. add a second player controlled by
--    different keys (if you have 2 players)
