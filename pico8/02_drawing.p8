pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- lesson 2: drawing shapes
-- learn to draw on the screen!
--
-- this program teaches you how to
-- draw shapes and understand the
-- coordinate system

-- =============================
-- what you'll learn:
-- =============================
-- 1. pico-8 coordinate system (0,0 is top-left)
-- 2. drawing rectangles with rect() and rectfill()
-- 3. drawing circles with circ() and circfill()
-- 4. drawing lines with line()
-- 5. the 16-color palette (0-15)

-- =============================
-- coordinate system:
-- =============================
-- screen is 128x128 pixels
-- x: 0 (left) to 127 (right)
-- y: 0 (top) to 127 (bottom)
-- (0,0) is the top-left corner

-- =============================
-- color palette (0-15):
-- =============================
-- 0=black, 1=dark blue, 2=dark purple, 3=dark green
-- 4=brown, 5=dark gray, 6=light gray, 7=white
-- 8=red, 9=orange, 10=yellow, 11=green
-- 12=blue, 13=indigo, 14=pink, 15=peach

function _init()
  -- no initialization needed for this demo
end

function _update()
  -- no updates needed for this demo
  -- we're just drawing static shapes
end

function _draw()
  -- clear screen to black
  cls()
  
  -- =============================
  -- drawing rectangles
  -- =============================
  
  -- draw a rectangle outline
  -- rect(x1, y1, x2, y2, color)
  -- x1,y1 is top-left corner
  -- x2,y2 is bottom-right corner
  rect(10, 10, 40, 30, 8)  -- red outline
  
  -- draw a filled rectangle
  -- rectfill(x1, y1, x2, y2, color)
  rectfill(50, 10, 80, 30, 11)  -- green filled
  
  -- label them
  print("rect", 14, 35, 7)
  print("rectfill", 50, 35, 7)
  
  -- =============================
  -- drawing circles
  -- =============================
  
  -- draw a circle outline
  -- circ(x, y, radius, color)
  -- x,y is the CENTER of the circle
  circ(25, 65, 10, 12)  -- blue outline
  
  -- draw a filled circle
  -- circfill(x, y, radius, color)
  circfill(65, 65, 10, 9)  -- orange filled
  
  -- label them
  print("circ", 17, 80, 7)
  print("circfill", 53, 80, 7)
  
  -- =============================
  -- drawing lines
  -- =============================
  
  -- draw lines
  -- line(x1, y1, x2, y2, color)
  line(10, 95, 50, 95, 10)   -- horizontal yellow
  line(60, 90, 60, 110, 14)  -- vertical pink
  line(70, 90, 85, 110, 13)  -- diagonal indigo
  
  print("lines", 10, 115, 7)
  
  -- =============================
  -- rainbow example
  -- =============================
  
  -- let's draw a rainbow of circles!
  for i=0,7 do
    circfill(100, 20+i*6, 3, i+8)
  end
  
  print("rainbow", 90, 75, 7)
  
  -- =============================
  -- fun pattern
  -- =============================
  
  -- nested squares
  for i=0,3 do
    rect(95+i*3, 90+i*3, 118-i*3, 113-i*3, 7-i)
  end
end

-- =============================
-- try these experiments:
-- =============================
-- 1. change the colors of shapes
-- 2. change the positions and sizes
-- 3. add more shapes
-- 4. create your own picture!
-- 5. try drawing a house, tree, or face
-- 6. experiment with the rainbow loop
--    (change the numbers and see what happens)

-- =============================
-- challenge:
-- =============================
-- draw a simple robot face using:
-- - rectfill for the head
-- - circfill for the eyes
-- - rect for the mouth
