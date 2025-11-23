Space Invaders — Implementation Specification (single HTML file)

Below is a precise, implementable specification for a modern, smooth, single-file HTML version of Space Invaders. It contains exact layout, colors, sizes, mechanics, animations, UI requirements, audio hooks, storage behavior and pseudocode/structure.

---

# Quick summary / end state

- Single index.html containing:
- a full-screen (or responsive) <canvas> used for all visuals,
- minimal CSS for centering and fonts,
- inline JavaScript that implements the game loop, input, state machine (Title → Playing → GameOver),
- audio using WebAudio (or <audio> tags) for SFX,
- high score persisted in localStorage,
- HUD always visible (score / high score / level / lives),
- title screen and game over screen with restart,
- 4 bunkers, each 5×4 blocks (each block 1 HP),
- 3 lives for player,
- each invader row has its own color,
- smooth animation using requestAnimationFrame and delta time.

---

# Screen & layout

Canvas:

- Base logical resolution: 800 × 600 pixels (fixed logical size for consistent behavior). Scale the canvas CSS to fit the available window while preserving aspect ratio. (Set canvas.width = 800; canvas.height = 600 and use CSS width: 100%; max-width: 1200px; height: auto;.)
- Coordinate origin: top-left (0,0).

UI/HUD (always visible during gameplay): drawn in the top 48 pixels (reserve area, not overlapped by playfield):
- Left: Score: XXXXX (font: sans-serif bold, 18px)
- Center: HIGH SCORE: XXXXX (font: sans-serif bold, 18px)
- Right: LIVES: ♥♥♥ LEVEL: N (use heart icons or small ship icons for lives). Keep HUD text color #FFFFFF on a subtle dark semi-transparent bar.

Title screen: centered logo, subtitle, controls, Press Space or Click to Start button. Show high-score below.

Game Over screen: same style; show final score, Game Over, Press Space or Click to Restart. If new high score, show NEW HIGH SCORE!.

---

# Visual style & colors (modern & fresh)

Use flat geometric shapes with subtle drop shadows and a thin neon accent glow. No pixel-art sprite requirement; invaders/bunkers/ship may be drawn procedurally with vector paths for crisp scaling.

Color palette (by row):

- Row 0 (top): #FF6B6B (red)
- Row 1: #FFB86B (orange)
- Row 2: #FFD56B (yellow)
- Row 3: #6BFFB8 (mint green)
- (If more rows later) Row 4: #6B9CFF (light blue)

Background: deep navy #071029 with subtle starfield (animated parallax dots).

Invader body fill: row color, with a thin stroke rgba(255,255,255,0.08) and slight drop shadow (draw a blurred rectangle/ellipse behind). Invader animation: two frames (open/closed) toggled on a timer to produce the classic movement feel.

Player ship: modern wedge shape, color #FFFFFF with accent #6B9CFF. Width: 48 px, height: 20 px.

Bunkers: each bunker is a 5×4 grid of rectangular blocks. Block color #2E8B57 with darker shading, destroyed block removed. Bunkers sit at y = 460 (so bunkers and player do not overlap).

---

# Playfield geometry & layout

- Top HUD: y = 0..48.
- Play area start: y = 48.
- Invader formation:
  - 5 columns × 11 rows is classic but we'll use: 11 columns × 5 rows (11 wide × 5 tall) — this is classic and looks balanced.
  - Each invader sprite cell (including spacing): width = 48 px, height = 42 px.
  - Horizontal spacing: 8 px gap between invader cells. Vertical spacing: 12 px.
  - Formation top-left start x = center the formation horizontally; y = 80 (just below HUD).
- Player:
  - Y position fixed at y = 540 (60 px above bottom).
  - X moves within [24, 776] (keep within canvas edges).
- Bunkers:
  - Four bunkers evenly spaced between screen center and sides:
    - Bunker width = 5 × blockWidth (blockWidth = 14 px), so bunker width = 70 px.
    - Bunker height = 4 × blockHeight (blockHeight = 12 px), bunker height = 48 px.
    - Y = 460.
    - X positions: roughly at 100, 270, 530, 700 (centered under invader columns).
  - Each block is destroyed in one hit (1 HP).

---

# Movement, speeds & physics (use delta time)

Frame timing: requestAnimationFrame with a delta-time (seconds) variable used for movement to ensure smoothness across refresh rates.

Base speeds (units pixels per second):

- Player horizontal speed: 260 px/s.
- Player bullet speed (player projectile): 420 px/s upward.
- Invader horizontal speed initial: 22 px/s.
- Invader drop amount on direction change: 18 px downward.
- Invader animation toggle interval: 0.45 s (decrease as game speeds up).
- UFO speed (if implemented): 140 px/s.

Speed scaling by remaining invaders:

- Let alive = number of alive invaders, total = initial total.
- speed = baseSpeed * (1 + 0.9 * (1 - alive/total)) — so invaders speed up gradually as some are killed. Also decrease animation toggle interval proportionally to speed (so they seem more frantic).

Movement rule:

- All invaders move as one formation. They move horizontally; if the leftmost or rightmost alive invader reaches canvas edge (margin 16 px), the entire formation shifts down by drop amount and flips horizontal direction.
- If any invader's y >= player.y - 40 → immediate PLAYER HIT (lose life) or instant game over if lives 0. (Classic ends if they reach bottom.)

Shooting:

- Player can have one active player shot at a time (classic). Player shot spawns from ship center top.
- Invader shooting: randomly choose shooters from bottom-most alive invaders in a column. Shooting frequency base: on average 1 shot per 1.1 seconds, scaled by current level and number of invaders (increase chance as alive decreases).
- Invader bullets speed: 190 px/s downward.
- Bullets are simple rectangles (4×12 px) for collisions.

Collision detection:

- Use Axis-Aligned Bounding Box (AABB) collisions between bullets and targets (invaders, player, bunkers).
- Bunker block collisions: bullet hitting a block removes the block (1 HP).
- Bullet vs bullet: if player bullet collides with invader bullet, both destroyed.

Bombs/explosions: when an invader is killed, spawn a short explosion animation (12–18 frames, 0.3s) and play explosion SFX.

---

# Lives & respawn:

- Player starts with 3 lives.
- On player death: play SPIWNING animation and subtract one life. Reset player ship position, clear all player bullets, optionally clear invader bullets (classic: invader bullets remain; but to be friendly, keep invader bullets).
- If lives reach 0 → go to Game Over.

---

# Scoring

Row indices (0 top → 4 bottom). Provide values per invader depending on row:
- Row 0 (top): 30
- Row 1: 20
- Row 2: 20
- Row 3: 10
- Row 4 (bottom): 10

High score:

- Stored as integer in localStorage['space_invaders_highscore']. When game ends (or on score change), update if current score > stored.

---

# Level progression:

Start at Level 1.
- Advance level when all invaders dead.
- Upon level-up:
  - Respawn full invader formation.
  - Increase baseSpeed by 12% (multiply) and slightly reduce animation interval by 8%.
  - Reposition player and reset bunkers to full.
  - Carry over player's lives and score.
- Optionally spawn a UFO (bonus ship) occasionally across top, awarding 50–300 points.

Win condition:

- No explicit final level; game continues indefinitely with increasing speed. Optionally after level N (e.g. 12) you can display You Win if you prefer.

---

Bunkers (detailed)

- Each bunker is an array [rows=4][cols=5] of blocks.
- Block size: width = 14 px; height = 12 px; margin between blocks = 2 px internal.
- Bunkers placed so there is horizontal space between them.
- Collision: bullet hits block -> remove block (set to destroyed). Play "block hit" SFX.
- Visual: draw each block as a rounded rectangle with bevel using two fills (top highlight, bottom dark).

---

# Sound effects

Use WebAudio API or <audio> elements. Required SFX and triggers:

- sfx-start — title screen start press
. sfx-shot — player shot
- sfx-invader-shot — invader bullet
- sfx-invader-death — invader explosion
- sfx-player-death — player explosion
- sfx-block-hit — bunker block hit
- sfx-ufo — UFO pass sound (loop or short)
- sfx-game-over — game over jingle

If sample files are not provided, the spec requires using simple procedural tones (WebAudio OscillatorNode with quick envelope and some white noise for explosion). Provide function playSFX(name) that either plays an audio buffer or synths it.

SFX volumes should be adjustable via a small Settings toggle on Title screen (mute / low / normal).

---

# Controls & input

Keyboard:

- Left: ArrowLeft or A → move left
- Right: ArrowRight or D → move right
- Fire: Space or W or K → shoot
- Pause: P or Escape (toggle)

Mouse / Touch:
- Clicking on canvas or pressing on-screen START/RESTART buttons.
- Touch: left side drag to move; tap right side to shoot (or provide virtual buttons).
- Also allow mouse move to set player X (optional) and click to shoot.

Input handling: use stateful keydown/keyup and polling in the update loop (don’t rely on discrete key events for motion). Poll keys every frame and move player by speed * delta.

---

# Game state machine

Enumerated states: TITLE, PLAYING, PAUSED, GAMEOVER.

Title state:

- Draw animated background.
- Show game title, controls, high score, Press SPACE to Start, sound and difficulty toggles.
- On start: fade out title UI (0.3s), initialize GameState and go to PLAYING.

Playing state:

- Update entities, draw all objects (HUD + playfield).
- If paused → draw "PAUSED" overlay.

GameOver state:

- Show final score, high score message, Press Space to restart and button. If new high score, highlight it.

---

# Rendering recommendations & smoothness

- Use double-buffering: the canvas is fine with requestAnimationFrame; avoid setInterval for animations. Use delta time (dt = (now - lastTime)/1000).
- For movement and animations, compute new positions using position += velocity * dt.
- Use consistent interpolation for visual properties.
- Use ctx.save() / ctx.restore() and draw shapes procedurally rather than loading many images (keeps single file).
- Keep draw order deterministic (background → stars → invaders → invader bullets → bunkers → player bullets → player → HUD → overlays).

For animation frames (invader toggle), toggle each X seconds using an accumulator timer that decreases as speed increases.

---

# Collision shapes & rules (explicit)

- Player shot: rectangle centered at ship x, top y.
- Invader hit test: AABB between bullet rectangle and invader bounding box.
- Invader bullet vs player: AABB.
- Invader bullet vs bunker block: AABB.
- Player bullet vs invader bullet: AABB.
- Player cannot harm own ship (friendly fire not allowed).

When shot hits invader:

- Remove invader from alive set.
- Add score += valueForRow.
- Play invader-death SFX.
- Trigger a small explosion particle effect.
- Check if alive == 0 → levelUp().

When invader bullet hits player:

- Play player-death SFX & explosion animation.
- lives -= 1. If lives > 0: respawn player after 0.8s invulnerability (flicker). If lives == 0: goto GAMEOVER.

---

# Performance & object management

- Use object pools for bullets and explosion particles to reduce GC.
- Keep max active bullets: invader bullets up to 6, player bullets 1.
- Limit particles to e.g. 30 active; reuse older ones.

---

# Networking / persistence

- High-score only in localStorage. Key space_invaders_highscore_v1.
- Optionally allow resetting highscore via Title menu.

---

# Accessibility & input hints

- Provide keyboard-only control hints on title screen.
- Display current FPS (optional, for debugging).
- Respect reduced motion setting: if user prefers reduced motion, disable fancy background animations.


# Sample file structure inside index.html

- <!doctype html>
- <style> minimal CSS for body, canvas, buttons.
- <canvas id="gameCanvas"></canvas>
- <script> main JS (all code).
  - Constants & config
  - Asset loader (optional)
  - Audio manager (WebAudio)
  - Input manager
  - Entity constructors: Invader, Player, Bullet, Bunker, Explosion, UFO
  - Game manager/state
  - init() and startLoop()
  - update(dt) and render()
  - requestAnimationFrame(loop)


# Pseudocode / main loop (concise)

```
let lastTime = performance.now();
function loop(now) {
  const dt = Math.min(0.033, (now - lastTime) / 1000); // clamp dt to avoid big jumps
  lastTime = now;
  update(dt);
  render();
  requestAnimationFrame(loop);
}
requestAnimationFrame(loop);
```

update(dt):
- handleInput(dt)
- update bullets positions, collisions
- update invader formation (move horizontally by speed*dt; if hits edge -> move down and flip)
- invader shooting logic (timer + random)
- update explosions and particles
- update HUD timers and check level completion

render():

clear canvas
- draw background + starfield (update starfield positions slowly)
- draw invaders (alive ones)
- draw invader bullets
- draw bunkers (loop blocks)
- draw player and player bullets
- draw explosions
- draw HUD (top bar)
- draw overlays for paused/title/game over

---

# Implementation notes & corner cases
- Keep all numeric constants up top as `const CONFIG = { CANVAS_W:800, CANVAS_H:600, ... }` so tuning is easy.
- Make invader hitboxes slightly smaller than visuals (e.g. reduce by 6 px) to avoid frustrating pixel-perfect hits.
- When formation speed changes, do not move invaders instantly; update speed scalar and continue movement smoothly.
- On level start, reset invader animation timer and spawn position.
- For reproducible behavior across browsers, test on Chrome & Firefox & Safari; use `performance.now()`.

---

# Example assets & placeholder SFX
- If you do not include WAV/OGG, implement tiny SFX generator helpers:
  - `tone(frequency, duration, type='square')` for shoot
  - white-noise burst for explosion
  - simple 2-tone pattern for title/start
These can be implemented using `AudioContext`, `OscillatorNode` + `GainNode` + `BiquadFilter`.

---

# Debugging hooks (recommended)
- `window.DEBUG = { showHitboxes: false, invaderSpeedScale: 1.0 }`
- Press `H` to toggle hitbox overlay.

---

# Example variables (initial values)
- `playerLives = 3`
- `score = 0`
- `highScore = parseInt(localStorage.getItem('space_invaders_highscore_v1') || 0)`
- `level = 1`
- `invaderRows = 5`
- `invaderCols = 11`
- `baseInvaderSpeed = 22 // px/s` (increases each level)

---

# Minimal rendering order checklist (must be consistent)
1. background (stars)
2. HUD background bar (semi-transparent)
3. invaders
4. invader bullets
5. bunkers (blocks)
6. player bullets
7. player ship
8. explosions/particles (blend add)
9. HUD text & icons
10. overlays (pause, title, game over)

---

# Testing checklist (what to verify)
- HUD never covered by canvas content and remains visible during play.
- 4 bunkers present, each initially 5×4 blocks and blocks removed on hit.
- Exactly 3 lives shown and decremented on death.
- Each invader row shows a unique color (as specified).
- Invaders move as a single formation, drop and speed up over time.
- One player shot allowed at a time.
- Invaders shoot, bullets collide with bunkers and player.
- High score persists across reloads.
- Smooth movement & animations at 60 FPS; works when scaled by CSS.

---

# Deliverables for handoff to programmer
1. `index.html` with the canvas, inline styles and inline script (all code one file).
2. A small `README` comment section in the HTML top describing controls and how to change constants.
3. Optional: a small folder of SFX files (or if none, the file includes WebAudio synth functions).

---

If you want, I can now:
- produce a **complete single-file `index.html`** starter implementation that follows this spec (with WebAudio procedural SFX and full game code), or
- provide the **exact constant configuration file** or **starter code skeleton** (boilerplate + game loop + entity classes).

Which one should I generate for you right now?
