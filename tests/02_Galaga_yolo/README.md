# Building a Galaga game with AI, the YOLO approach

## TL;DR;

1. The models have between no and only a vague idea of what a Galaga game is. 
2. Models with probably 'best' idea: GPT5 and Sonnet 4.5
3. Qwen and Gemini build more or less SPace Invaders.
4. As one does not know what the models know and what not, a specification document is probably always needed for many use cases.

## Models tested

Online models I tested (via web interfaces) to establish a base line:

- Gemini 2.5 Pro
- GPT5
- Sonnet 4.5
- Qwen 3 coder and Qwen 3 max

When the models had a reasoning effort available, I set it to "high".

Local models:

- [Qwen3-coder 30B](https://ollama.com/library/qwen3-coder) as delivered by Ollama by
  default. That is a 4 bit quantisation
  model and allows me to have a bit more than 96k tokens of context on my 32 GiB VRAM

- [Qwen3-Coder-30B-A3B-Instruct](https://huggingface.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF) in 2, 3, and 4 bit quantisation from unsloth@huggingface.  
  I also threw in their "UD 4 bit XL" model. UD stands for "Unsloth Dynamic", a special
  kind of quantisation reduction they claim produces better results than other methods.

## Why Galaga?

Contrary to Space Invaders, I suspect there are a lot less examples online regarding Galaga. Which makes it more demanding for any model to do "the right thing" in YOLO mode without further information.

For a short refresher on what the arcade Galaga version looked like, see [this video](https://www.youtube.com/watch?v=dvjapcHsqXY).

## Prompt

The LLMs all got this simple command `Write a Galaga game, contained in a single HTML file.`

## Results at a glance

(To be expanded)

In a nutshell: it is clear that, compared to Space Invaders, the large online models had not as well an idea of what constitutes a Galaga game. Some of them created a Space Invaders game with a bit of alien wiggle, a few added alien attacks. But none of them had the characteristic alien formation buildup by alien squads flying in in figures resembling partial Lissajous curves.

### Results online models

- Gemini 2.5 pro: both trials looked either exactly like a Space Invaders or a Space Invaders+
- GPT 5: almost Galaga, but still quite far off the original
- Qwen 3 coder: pure Space Invaders
- Qwen 3 max: one pure Space Invaders, one a mixture Galaga and Space Invaders
- Sonnet 4.5: almost Galaga, but still quite far off the original

### Results local models

Being descendants of Qwen 3 coder (which had apparently no idea what Galaga is), the results were predictably bad in a sense that they were more Space Invaders than Galaga.

<!-- Everything below this line is generated automatically, do not change -->

---
---
---

> [!IMPORTANT]
> In the list of experiments below, click on the thumbnail to test - in your browser - the examples built by the LLMs.
> Clicking on the experiment name (left of thumbnail) brings you to the GitHub directory for
> the given experiment.

## Online model experiments for Galaga

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Gemini25pro/t1">tests/02_Galaga_yolo/online/Gemini25pro/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Gemini25pro/t1/galaga.html">
  <img src="online/Gemini25pro/t1/thumb.png" style="vertical-align: middle;">
</a>

Almost a "Space Invaders".
Smooth player and alien anim. Sound.
Bugs:
- very few alien shots
- very few alien attacks
- aliens performing an attack leave a copy of themselves at the original formation position
- aliens don't move after a game over.
- aliens don't move in new level


### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Gemini25pro/t2">tests/02_Galaga_yolo/online/Gemini25pro/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Gemini25pro/t2/galaga.html">
  <img src="online/Gemini25pro/t2/thumb.png" style="vertical-align: middle;">
</a>

Not a Galaga game, but "Space Invaders"
Smooth player and alien anim.
A bit of a bullet hell.
### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/GPT5/t1">tests/02_Galaga_yolo/online/GPT5/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/GPT5/t1/galaga.html">
  <img src="online/GPT5/t1/thumb.png" style="vertical-align: middle;">
</a>

Almost Galaga.
Very nice graphics, smooth anims. Sound.
Bugs:
- enemies in attack go to random position after attack if they did not reach bottom of screen
- clearing the first wave, gane jumps to wave 49 or 50
- some enemies in later waves outside screen
### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/GPT5/t2">tests/02_Galaga_yolo/online/GPT5/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/GPT5/t2/galaga.html">
  <img src="online/GPT5/t2/thumb.png" style="vertical-align: middle;">
</a>

Almost Galaga.
Very nice graphics, smooth anims. Sound.
Bugs:
- player lives do not decrease
- some UI elements overlap playing field
- absolute bullet hell
- Sound not on by default
### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Qwen3coder/t1">tests/02_Galaga_yolo/online/Qwen3coder/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Qwen3coder/t1/galaga.html">
  <img src="online/Qwen3coder/t1/thumb.png" style="vertical-align: middle;">
</a>

Not Galaga, but Space Invaders.
Smooth anims, particle explosions.

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Qwen3coder/t2">tests/02_Galaga_yolo/online/Qwen3coder/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Qwen3coder/t2/galaga.html">
  <img src="online/Qwen3coder/t2/thumb.png" style="vertical-align: middle;">
</a>

Not Galaga, but Space Invaders.
Jagged alien movement.
Bugs:
- does not restart correctly after a game over

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Qwen3coder/t3">tests/02_Galaga_yolo/online/Qwen3coder/t3</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Qwen3coder/t3/galaga.html">
  <img src="online/Qwen3coder/t3/thumb.png" style="vertical-align: middle;">
</a>

Not Galaga, but Space Invaders.
Smooth animations.
Bugs:
- some UI elements overlap player
- a bit bullet hell

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Qwen3Max/t1">tests/02_Galaga_yolo/online/Qwen3Max/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Qwen3Max/t1/galaga.html">
  <img src="online/Qwen3Max/t1/thumb.png" style="vertical-align: middle;">
</a>

Not Galaga, but Space Invaders
Bugs:
- alien movement logic (game breaking)
- bullet hell
### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Qwen3Max/t2">tests/02_Galaga_yolo/online/Qwen3Max/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Qwen3Max/t2/galaga.html">
  <img src="online/Qwen3Max/t2/thumb.png" style="vertical-align: middle;">
</a>

Mixture of Space Invaders and Galaga
Smooth animations, sound.
Has sort of double ship, triple shots upgrade mechanics.
Bugs:
- first iteration had a game breaking freeze when player picked up additional ship, needed additional bugfixing round
### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Sonnet45/t1">tests/02_Galaga_yolo/online/Sonnet45/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Sonnet45/t1/galaga.html">
  <img src="online/Sonnet45/t1/thumb.png" style="vertical-align: middle;">
</a>

Almost Galaga, albeit simplistic.
Smooth retrographics, particle animation explosions.
Bugs:
- alien attack movement logic

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/online/Sonnet45/t2">tests/02_Galaga_yolo/online/Sonnet45/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/online/Sonnet45/t2/galaga.html">
  <img src="online/Sonnet45/t2/thumb.png" style="vertical-align: middle;">
</a>

Almost Galaga, albeit simplistic.
Smooth retrographics, particle animation explosions.
Bugs:
- restart game after game over does not work
- stars in starfield are in diaginal lines


## Local model experiments for Galaga

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t1">tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t1/galaga.html">
  <img src="local/qwen3-coder-30B-ollama/4bit_t1/thumb.png" style="vertical-align: middle;">
</a>

I lost my notes for this experiment, it was the very first I performed locally.

I remember getting a pretty good Space Invaders clone without  obvious errors. I then decided to write something like this to the model "This is not Galaga, this is Space Invaders." I did tghis in several iterations, in each the model added progressively complex alien movement patterns, but no attack patterns.

Interesting result, albeit not Galaga :-)
### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t2">tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t2/galaga.html">
  <img src="local/qwen3-coder-30B-ollama/4bit_t2/thumb.png" style="vertical-align: middle;">
</a>

Not a space invaders game, also not Galaga. More a Shoot Em Up.
Bugs:
- first iteration (1:07 minutes) resulted in non-functional game, needed bugfixing (50 seconds)
- some player shots do not connect with (kill) aliens

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t3">tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t3</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/local/qwen3-coder-30B-ollama/4bit_t3/galaga.html">
  <img src="local/qwen3-coder-30B-ollama/4bit_t3/thumb.png" style="vertical-align: middle;">
</a>

1st iteration (1:17 minutes): more or less a fail. Resulted in a straight Space Invaders.

2nd iteration (3:59 minutes): when pointing this out, model created again a Space Invaders, but with wavy alien movements. Plus, a bug that randomly freezes the game (unknown cause).

3rd to 5th iteration (~4 minutes each): the random freeze could not be fixed

Stopped experiment.

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/local/qwen3-coder-30B-unsloth/4bit_t1">tests/02_Galaga_yolo/local/qwen3-coder-30B-unsloth/4bit_t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/local/qwen3-coder-30B-unsloth/4bit_t1/galaga.html">
  <img src="local/qwen3-coder-30B-unsloth/4bit_t1/thumb.png" style="vertical-align: middle;">
</a>

1st iteration: 47s. Space Invaders game. Bugs: restart after game over does not work. All enemies killed should trigger new wave but does not.

2nd iteration (endless loop): initial response came after 1:56 minutes, but contained non-HTML, non-JavaScript text ("++REPLACE"). Cline then went into endless loop trying to fix it. Manual stop and fix resulted in still Space Invaders game, with same bugs.

### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/tests/02_Galaga_yolo/local/qwen3-coder-30B-unsloth/4bitUD_t1">tests/02_Galaga_yolo/local/qwen3-coder-30B-unsloth/4bitUD_t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/tests/02_Galaga_yolo/local/qwen3-coder-30B-unsloth/4bitUD_t1/galaga.html">
  <img src="local/qwen3-coder-30B-unsloth/4bitUD_t1/thumb.png" style="vertical-align: middle;">
</a>

1st iteration (1:10): a Space Invaders Game. Buggy (enemies don't shoot, slow enemy movement)

2nd iteration (7:03): still a Space Invaders Game. Still no enemies hooting, still slow enemy movement.

Stopped experiment.

One reason for very long 2nd iteration could be incompatibility of model to what Clone expects. There were multiple message like the following "*The model used search patterns that don't match anything in the file. Retrying...*"

