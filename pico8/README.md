# PICO-8 Game Development Course

Welcome to the PICO-8 game development starter course! This collection of files will help you learn game development from scratch using PICO-8, a fantasy console perfect for beginners.

## What is PICO-8?

PICO-8 is a fantasy console for making, sharing, and playing tiny games. It has built-in tools for creating code, sprites, maps, and sound. PICO-8's limitations (128x128 pixel display, 16 colors, 32KB cart size) make it perfect for learning because you can focus on core game development concepts without getting overwhelmed.

## Getting Started

1. **Download PICO-8**: Get it from [lexaloffle.com/pico-8.php](https://www.lexaloffle.com/pico-8.php)
2. **Install PICO-8**: Follow the installation instructions for your platform
3. **Run PICO-8**: Launch the application to see the command prompt

## Course Structure

Work through these lessons in order:

### Lesson 1: Hello World (01_hello_world.p8)
**What you'll learn:**
- PICO-8 program structure
- The three main functions: `_init()`, `_update()`, and `_draw()`
- Basic text output with `print()`
- Understanding the game loop

**Key Concepts:**
- Initialization
- Frame-by-frame updates
- Drawing to screen

### Lesson 2: Drawing Shapes (02_drawing.p8)
**What you'll learn:**
- Drawing shapes: rectangles, circles, lines
- Understanding coordinates (0,0 is top-left)
- Using colors (16 color palette: 0-15)
- Filled vs outline shapes

**Key Concepts:**
- Graphics primitives
- Coordinate system
- Color palette

### Lesson 3: Player Movement (03_player_movement.p8)
**What you'll learn:**
- Reading button input with `btn()`
- Moving a player character
- Variables to track position
- Boundary checking

**Key Concepts:**
- Input handling
- Game state
- Position and velocity
- Screen boundaries

### Lesson 4: Simple Bouncing Ball (04_bouncing_ball.p8)
**What you'll learn:**
- Animation with velocity
- Collision detection with screen edges
- Direction reversal
- Creating smooth movement

**Key Concepts:**
- Physics basics
- Collision response
- Frame-independent movement

### Lesson 5: Collecting Items (05_collect_game.p8)
**What you'll learn:**
- Multiple game objects
- Collision detection between objects
- Score tracking
- Spawning new objects
- Win conditions

**Key Concepts:**
- Object management
- Game state management
- Collision detection
- Game design basics

## How to Use These Files

1. Open PICO-8
2. Type `cd` followed by the path to this folder
3. Type `load lesson_name.p8` (e.g., `load 01_hello_world.p8`)
4. Type `run` to execute the program
5. Press ESC to stop and return to the editor
6. Type `reboot` to clear memory and start fresh

## Useful PICO-8 Commands

- `load filename.p8` - Load a cartridge
- `save filename.p8` - Save your work
- `run` - Run the current program
- `stop` or ESC - Stop the program
- `reboot` - Restart PICO-8
- `ls` - List files in current directory
- `cd directory` - Change directory

## PICO-8 Button Constants

- 0: Left arrow
- 1: Right arrow
- 2: Up arrow
- 3: Down arrow
- 4: O button (Z key)
- 5: X button (X key)

## Common Functions Reference

### Drawing Functions
- `cls()` - Clear screen
- `print(text, x, y, color)` - Print text
- `rect(x1, y1, x2, y2, color)` - Draw rectangle outline
- `rectfill(x1, y1, x2, y2, color)` - Draw filled rectangle
- `circ(x, y, radius, color)` - Draw circle outline
- `circfill(x, y, radius, color)` - Draw filled circle
- `line(x1, y1, x2, y2, color)` - Draw line

### Input Functions
- `btn(button)` - Check if button is currently pressed (returns true/false)
- `btnp(button)` - Check if button was just pressed this frame (returns true/false)

### Math Functions
- `abs(x)` - Absolute value
- `min(a, b)` - Minimum of two values
- `max(a, b)` - Maximum of two values
- `rnd(n)` - Random number from 0 to n (not including n)
- `flr(x)` - Floor (round down)

## Tips for Learning

1. **Experiment!** Change numbers, colors, and positions to see what happens
2. **Start small** - Work through lessons in order
3. **Read the comments** - Each file has detailed explanations
4. **Break things** - Making mistakes is how you learn
5. **Make it yours** - Modify the examples to create your own games
6. **Share your work** - PICO-8 makes it easy to share your creations

## Next Steps

After completing these lessons, you can:
- Explore the PICO-8 manual (type `help` in PICO-8)
- Try the sprite and map editors (press ESC while running, then click the icons)
- Visit the PICO-8 forums: [lexaloffle.com/bbs/?cat=7](https://www.lexaloffle.com/bbs/?cat=7)
- Check out tutorials on YouTube
- Browse games on the PICO-8 BBS to see what's possible

## Resources

- Official PICO-8 Manual: Type `help` in PICO-8
- PICO-8 Education Edition: Free for educators
- Community forums: [lexaloffle.com/bbs](https://www.lexaloffle.com/bbs)
- PICO-8 Zine: Free tutorials and tips

Have fun making games!
