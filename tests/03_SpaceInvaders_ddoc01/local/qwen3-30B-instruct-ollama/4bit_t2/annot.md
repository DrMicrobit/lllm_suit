Initial version 4:53. No invaders, levels count up by the tenth of the second. --> When starting game, no invaders are drawn. Please fix.

Same problem as in t1: "The model used search patterns that don't match anything in the file. Retrying..." Then endless loop of trying and trying again.

Programming / logic error of the model: INVADER_ROWS and INVADER_COLS were not defined in CONFIG, leading to no invaders being created. D'oh.

When fixing the bug by hand, game starts bug several other bugs appear: player cannot shoot, alien shots go through bunker, etc.

Stopping this experiment.