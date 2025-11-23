1:30 --> When starting the game, there are no aliens on screen?

Fix in ~30s, albeit as code frgament.

IMPORTANT: the cause of this error was analysed correctly by Qwen 3 coder, here is the analysis.
```text
You're right, I see the issue. The problem is that I defined CONFIG.INVADER_COLS and CONFIG.INVADER_ROWS constants but then hardcoded the values (5 rows, 11 columns) directly in the initInvaders() function. The constants weren't defined in the CONFIG object, causing the invaders to be positioned incorrectly.
```

To keep in mind: the above error cause will strike again in multiple trials with local Qwen 3 coder descendants. Though there, the models were not able to find the cause.

- Features: start screen, game over screen, 3 lives, score, high-score, sound.
- Bugs: None after above bugfix.
- Graphics: very simplistic shapes, ok-ish. Starfield parallax.
- Comments: Very playable, albeit speed increase of alien formation a bit too steep.