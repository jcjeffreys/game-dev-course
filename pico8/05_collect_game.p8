pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- lesson 5: collecting items game
-- make a complete game!
--
-- this program teaches you how to
-- create a simple but complete game
-- with player, items, score, and win condition

-- =============================
-- what you'll learn:
-- =============================
-- 1. managing multiple game objects
-- 2. collision detection between objects
-- 3. tracking game state (score, items)
-- 4. spawning new objects
-- 5. win conditions and game over
-- 6. putting it all together!

-- =============================
-- global variables
-- =============================

-- player
player = {
  x = 64,
  y = 64,
  size = 5,
  speed = 2,
  color = 11  -- green
}

-- items to collect
items = {}

-- game state
score = 0
goal = 10  -- collect this many to win
game_won = false

-- spawn timer
spawn_timer = 0
spawn_delay = 30  -- frames between spawns

function _init()
  -- reset game
  player.x = 64
  player.y = 64
  score = 0
  game_won = false
  items = {}
  spawn_timer = 0
  
  -- create initial items
  for i=1,3 do
    spawn_item()
  end
end

-- =============================
-- helper function: spawn new item
-- =============================

function spawn_item()
  local item = {
    x = rnd(118) + 5,  -- random x (5 to 123)
    y = rnd(118) + 5,  -- random y (5 to 123)
    size = 3,
    color = 10  -- yellow
  }
  add(items, item)
end

-- =============================
-- helper function: check collision
-- =============================

function collide(x1, y1, r1, x2, y2, r2)
  -- calculate distance between centers
  local dx = x1 - x2
  local dy = y1 - y2
  local dist = sqrt(dx*dx + dy*dy)
  
  -- collision if distance < sum of radii
  return dist < (r1 + r2)
end

function _update()
  -- skip updates if game is won
  if game_won then
    -- press x to restart
    if btnp(5) then
      _init()
    end
    return
  end
  
  -- =============================
  -- player movement
  -- =============================
  
  if btn(0) then player.x -= player.speed end
  if btn(1) then player.x += player.speed end
  if btn(2) then player.y -= player.speed end
  if btn(3) then player.y += player.speed end
  
  -- keep player on screen
  player.x = mid(player.size, player.x, 127-player.size)
  player.y = mid(player.size, player.y, 127-player.size)
  
  -- =============================
  -- check collisions with items
  -- =============================
  
  for i=#items,1,-1 do  -- iterate backwards
    local item = items[i]
    
    if collide(player.x, player.y, player.size,
               item.x, item.y, item.size) then
      -- collect item
      deli(items, i)
      score += 1
      
      -- check win condition
      if score >= goal then
        game_won = true
      end
    end
  end
  
  -- =============================
  -- spawn new items
  -- =============================
  
  spawn_timer += 1
  
  if spawn_timer >= spawn_delay and #items < 8 then
    spawn_item()
    spawn_timer = 0
  end
end

function _draw()
  -- clear screen to dark blue
  cls(1)
  
  -- =============================
  -- draw items
  -- =============================
  
  for item in all(items) do
    -- draw item with pulsing effect
    local pulse = sin(time()*2) * 0.5 + 0.5
    local size = item.size + pulse
    circfill(item.x, item.y, size, item.color)
    -- add sparkle
    circfill(item.x-1, item.y-1, 1, 7)
  end
  
  -- =============================
  -- draw player
  -- =============================
  
  circfill(player.x, player.y, player.size, player.color)
  circfill(player.x-2, player.y-2, 1, 7)  -- highlight
  
  -- =============================
  -- draw ui
  -- =============================
  
  -- score at top
  print("score: "..score.."/"..goal, 5, 5, 7)
  
  if game_won then
    -- victory screen
    rectfill(20, 50, 108, 80, 0)
    rect(20, 50, 108, 80, 10)
    print("you win!", 46, 58, 10)
    print("press x to play again", 24, 68, 7)
  else
    -- instructions
    print("collect the stars!", 28, 115, 7)
  end
  
  -- border
  rect(0, 0, 127, 127, 5)
end

-- =============================
-- understanding this game:
-- =============================
-- 1. items[] is a table (array) that holds
--    all the collectible items
-- 2. we use add() to add new items
-- 3. we use deli() to remove collected items
-- 4. collision detection uses distance formula
-- 5. game state is tracked with variables
--    (score, game_won)

-- =============================
-- try these experiments:
-- =============================
-- 1. change the goal to collect more/fewer items
-- 2. make items move around
-- 3. change spawn_delay to spawn faster/slower
-- 4. add different colored items worth different points
-- 5. add obstacles to avoid
-- 6. add a timer to make it challenging

-- =============================
-- challenge:
-- =============================
-- 1. add enemies that chase the player
-- 2. add power-ups that increase speed
-- 3. add levels with increasing difficulty
-- 4. make items that move or bounce
-- 5. add sound effects when collecting items
--    (check pico-8 sfx() function)
-- 6. create a high score system

-- =============================
-- congratulations!
-- =============================
-- you've learned the basics of game development!
-- now try making your own game from scratch!
