Reduced context to 48 Ki to run in VRAM.

3:52 initial version. Game freezes. Decided to go console route --> I get the following error on the console: Uncaught TypeError: can't access property "x", gameState.playerBullet is null
    update index.html:465
    loop index.html:837

Model answered with:
```
I need to fix the error in the collision detection code. The issue is that the code is trying to access properties of gameState.playerBullet when it's null. Let me fix this by adding proper null checks.
```

**Argh!**, no not what should be done.

And ... same problem occurs again. Stopping experiment here.
