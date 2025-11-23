Initial version 4:37. Similar error to equivalent Ollama model: no invaders drwan. And similar reason: some mix-ups. Non-existing CONFIG.INVADER_ROWS and _COLUMNS, but also gameState.invaderRows and .invaderColumns.

Once fixed manually, further bugs:
- aliens don't move
- player shots not centered on player ship
- player shots do not destroy bunker blocks
- duplicated HUD elements

Tried bug fixing --> The aliens are not moving.

Leads to looping cline API calls (like this and similar): "Cline wants to search this directory for `move.*?invaders.*?update`:", seemingly forever

Stopping experiment here.