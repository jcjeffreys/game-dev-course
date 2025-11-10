# PICO-8 Quick Reference

This is a handy reference guide for common PICO-8 functions and patterns.

## Program Structure

```lua
function _init()
  -- runs once at start
end

function _update()
  -- runs 30 times per second
  -- update game logic here
end

function _draw()
  -- runs 30 times per second
  -- draw everything here
end
```

## Drawing Functions

```lua
cls()                              -- clear screen (default: black)
cls(5)                             -- clear to color 5

print("hello", x, y, color)        -- draw text
spr(n, x, y)                       -- draw sprite n at position

pset(x, y, color)                  -- set pixel
pget(x, y)                         -- get pixel color

line(x1, y1, x2, y2, color)        -- draw line

circ(x, y, r, color)               -- draw circle outline
circfill(x, y, r, color)           -- draw filled circle

rect(x1, y1, x2, y2, color)        -- draw rectangle outline
rectfill(x1, y1, x2, y2, color)    -- draw filled rectangle

pal(c1, c2)                        -- swap color c1 for c2
pal()                              -- reset palette
```

## Input Functions

```lua
btn(b)                             -- is button b held? (true/false)
btnp(b)                            -- was button b just pressed? (true/false)

-- button numbers:
-- 0=left, 1=right, 2=up, 3=down, 4=O, 5=X
```

## Math Functions

```lua
abs(x)                             -- absolute value
min(a, b)                          -- minimum
max(a, b)                          -- maximum
mid(a, b, c)                       -- middle value (clamp b between a and c)

flr(x)                             -- floor (round down)
ceil(x)                            -- ceiling (round up)

sin(x)                             -- sine (0 to 1 for full cycle)
cos(x)                             -- cosine (0 to 1 for full cycle)

atan2(dx, dy)                      -- angle from 0 to 1

rnd(x)                             -- random number from 0 to x (not including x)
srand(x)                           -- set random seed

sqrt(x)                            -- square root
```

## Table Functions

```lua
add(t, v)                          -- add value v to table t
del(t, v)                          -- delete value v from table t
deli(t, i)                         -- delete item at index i from table t
count(t)                           -- count items in table
all(t)                             -- iterate over table (use in for loop)

-- example:
items = {}
add(items, {x=10, y=20})
for item in all(items) do
  print(item.x)
end
```

## Strings

```lua
s = "hello"
s = "hello".."world"               -- concatenation
s = "value:"..123                  -- concatenate with number
#s                                 -- length of string s
sub(s, start, end)                 -- substring
```

## Common Patterns

### Player Movement with Boundaries
```lua
-- update position
if btn(0) then player.x -= speed end
if btn(1) then player.x += speed end

-- keep on screen
player.x = mid(0, player.x, 127)
player.y = mid(0, player.y, 127)
```

### Distance Between Two Points
```lua
function dist(x1, y1, x2, y2)
  local dx = x2 - x1
  local dy = y2 - y1
  return sqrt(dx*dx + dy*dy)
end
```

### Circle Collision Detection
```lua
function collide(x1, y1, r1, x2, y2, r2)
  local d = dist(x1, y1, x2, y2)
  return d < (r1 + r2)
end
```

### Timer Pattern
```lua
timer = 0

function _update()
  timer += 1
  if timer >= 30 then  -- every 30 frames (1 second)
    -- do something
    timer = 0
  end
end
```

### Spawning Objects
```lua
function spawn_enemy()
  local e = {
    x = rnd(128),
    y = rnd(128),
    dx = rnd(2) - 1,
    dy = rnd(2) - 1
  }
  add(enemies, e)
end
```

### Removing Dead Objects
```lua
-- iterate backwards when deleting
for i=#enemies,1,-1 do
  local e = enemies[i]
  if e.dead then
    deli(enemies, i)
  end
end
```

### Simple Animation
```lua
-- frame-based
frame = 0
function _update()
  frame = (frame + 1) % 4  -- cycles 0,1,2,3
end

-- time-based (smoother)
function _draw()
  local f = flr(time() * 8) % 4  -- 8 fps animation
  spr(f, x, y)
end
```

### Bouncing Off Walls
```lua
-- update position
x += dx
y += dy

-- bounce off edges
if x < 0 or x > 127 then dx = -dx end
if y < 0 or y > 127 then dy = -dy end
```

## Colors (0-15)

```
 0 = black        8 = red
 1 = dark blue    9 = orange
 2 = dark purple 10 = yellow
 3 = dark green  11 = green
 4 = brown       12 = blue
 5 = dark gray   13 = indigo
 6 = light gray  14 = pink
 7 = white       15 = peach
```

## Screen & Coordinates

- Screen size: 128 x 128 pixels
- Origin (0,0) is top-left corner
- X increases to the right (0-127)
- Y increases downward (0-127)
- Center of screen: (64, 64)

## Tips

1. **Frame rate**: PICO-8 runs at 30 FPS
2. **Time**: `time()` returns seconds since program start
3. **Debug**: Use `print()` to display variable values
4. **Stop program**: Press ESC
5. **Token limit**: Max 8192 tokens (simplified: statements/operators)
6. **Memory**: Keep an eye on sprite/map/music memory usage

## Useful Commands (in PICO-8 console)

```
load filename.p8    -- load cartridge
save filename.p8    -- save cartridge
run                 -- run program
stop                -- stop program (or press ESC)
reboot              -- restart PICO-8

ls                  -- list files
cd                  -- change directory

help                -- show help
```

## Next Steps

After mastering these basics:
- Learn sprite editor (press ESC → click sprite tab)
- Learn map editor for levels
- Learn sound/music editor
- Study advanced collision detection
- Explore particle effects
- Learn state machines for game states
- Study procedural generation

Happy coding! 🎮
