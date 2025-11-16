![](./title.png)

# Suitability of local LLMs for AI assisted coding

I made this repo to document a couple of experiments I ran in Nov 2025
to assess the suitability of local LLMs for AI assisted programming.

Online models I tested (via web interfaces) to establish a base line:

- Gemini 2.5 (Flash & Pro versions)
- GPT5
- Opus 4.1 & Sonnet 4.5
- Qwen 3 coder

Local models I tested:

- [Qwen3-coder 30B](https://ollama.com/library/qwen3-coder) as delivered by Ollama by
  default. That is a 4 bit quantisation
  model and allows me to have a bit more than 96k tokens of context on my 32 GiB VRAM

- [Qwen3-Coder-30B-A3B-Instruct](https://huggingface.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF) in 2, 3, and 4 bit quantisation from unsloth@huggingface.  
  I also threw in their "UD 4 bit XL" model. UD stands for "Unsloth Dynamic", a special
  kind of quantisation reduction they claim produces better results than other methods.

Software environment:

- Ubuntu 24.04, with NVidia drivers
- VSCode with the Cline extension for AI assisted coding, calling local Ollama models
- Ollama to run the LLM models

Relevant hardware:

- 2x NVidia 4060 Ti with 16 GiB each to run local models via Ollama

Context size for local models was set to 96 KiB for all local models as this fits into the 32 GiB VRAM of my to cards for all 4 bit models.

## Experiments

The following is a list of experiments. I ran each model at least twice (postfix _tX in experiment directory), some of them more often.

The files in this repository only record the final state of each experiment. That is, if intermediate versions existed that needed bugfix, those are not present.

Not every experiment is bugfixed. If needed I usually did one or two rounds of fixes and then stopped.

The LLMs all got this simple command `Write a space invaders game, contained in a single HTML file.`

> [!IMPORTANT]
> Click on the thumbnail to test - in your browser - the examples built by the LLMs.
> Clicking on the experiment name (left of thumbnail) brings you to the GitHub directory for
> the given experiment.

<!-- Everything below this line is generated automatically, do not change -->

### Local model experiments for Space Invaders

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t1">./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t1/thumb.png" style="vertical-align: middle;">
</a>

Very basic. Title screen, restart after game over. Smooth anim. 
Continuous autofire, 1 life.  Alien projectiles spawn in any row.
Needed 3 bugfixing iterations, inlcuding 1 game breaking (game did not start).

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t2">./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t2/thumb.png" style="vertical-align: middle;">
</a>

Very basic. Title screen, restart after game over. Smooth anim.
Continuous autofire, 3 lives. Alien projectiles spawn in any row.
Needed 2 bugfixing iterations.

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t3">./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t3</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t3/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t3/thumb.png" style="vertical-align: middle;">
</a>

Very basic. Title screen, restart after game over. Smooth anim. 
Continuous autofire, 1 life. Alien projectiles spawn in any row. Player projectiles are
circles instead of lines like in other versions.
One-shot: no bugfixing.
#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t4">./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t4</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t4/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t4/thumb.png" style="vertical-align: middle;">
</a>

Very basic. No title screen, restart after game over.
Continuous autofire, 3 lives. Alien projectiles spawn in any row.
Could not get smooth animation even after 3 bugfixing iterations.

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t5">./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t5</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t5/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-ollama/4bit_t5/thumb.png" style="vertical-align: middle;">
</a>

Very basic. Title screen, restart after game over.
Continuous autofire, 3 lives. Aliens don't shoot.
Could not get smooth anim after 3 bugfixing iterations.

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/2bit_t1">./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/2bit_t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/2bit_t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/2bit_t1/thumb.png" style="vertical-align: middle;">
</a>

Extremely basic. No Title screen. Smooth anim.
Riddled with bugs: alien movement; player cannot be killed.

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/2bit_t2">./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/2bit_t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/2bit_t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/2bit_t2/thumb.png" style="vertical-align: middle;">
</a>

Extremely basic. Title screen. Smooth anim.
Bugs: alien movement; aliens don't shoot.
#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/3bit_t1">./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/3bit_t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/3bit_t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/3bit_t1/thumb.png" style="vertical-align: middle;">
</a>

Weird mixture of modernised and retro graphics. Title screen. Smooth anim.
Riddled with bugs: Game did not start (needed bugfixing) alien movement; graphics scaling;
jagged animation.
#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/3bit_t2">./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/3bit_t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/3bit_t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/3bit_t2/thumb.png" style="vertical-align: middle;">
</a>

Basic version. Title screen, restart after Game Over. Smooth alian anim, jagged player anim.
Buggy player anim and response to keypresses (delays).
#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bit_t1">./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bit_t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bit_t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bit_t1/thumb.png" style="vertical-align: middle;">
</a>

Probably best local version. Smooth anim, starfield!
Plus:
- overall aesthetics of screen and text
- aliens have 'eyes'
- a moving starfield!
- score counter
- player has only 1 life

Bugs:
- the player can spam shots, laserlike
- the start button is too low on some browsers, almost hidden
- there are no waves: when the player has shot all aliens, a message appears with "You win", and the possibility to restart the game

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bit_t2">./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bit_t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bit_t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bit_t2/thumb.png" style="vertical-align: middle;">
</a>

Very basic version.
Bugs: aliens don't shoot, aliens move way too slow, game does not recognise player having shot all aliens.

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bitUD_t1">./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bitUD_t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bitUD_t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bitUD_t1/thumb.png" style="vertical-align: middle;">
</a>

initial version 1 minutes 13 seconds. Nice aesthetics, but aliens move too slow.
- two additional fixing rounds (each 7 seconds) and aliens move fast enough, although jerky
- then: bug uncovered, when all aliens are shot no next wave appears. Fixing this took 20s.
- then: I notice that the wave difficulty does not increase, every wave runs at the same speed. Asking the model to "add a display for alien speed" not only adds said display, but the model suddenly realises the bug all by itself and fixes it. Oh wow.
- one last try to fix the jerky movement being unsuccessful (1 minute 45 seconds)
#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bitUD_t2">./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bitUD_t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bitUD_t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/local/qwen3-coder-30B-unsloth/4bitUD_t2/thumb.png" style="vertical-align: middle;">
</a>


### Online model experiments for Space Invaders

#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Gemini25Flash/t1">./tests/SpaceInvaders/online/Gemini25Flash/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Gemini25Flash/t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Gemini25Flash/t1/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Gemini25Flash/t2">./tests/SpaceInvaders/online/Gemini25Flash/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Gemini25Flash/t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Gemini25Flash/t2/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Gemini25pro/t1">./tests/SpaceInvaders/online/Gemini25pro/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Gemini25pro/t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Gemini25pro/t1/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Gemini25pro/t2">./tests/SpaceInvaders/online/Gemini25pro/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Gemini25pro/t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Gemini25pro/t2/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/GPT5/t1">./tests/SpaceInvaders/online/GPT5/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/GPT5/t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/GPT5/t1/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/GPT5/t2">./tests/SpaceInvaders/online/GPT5/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/GPT5/t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/GPT5/t2/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Opus41/t1">./tests/SpaceInvaders/online/Opus41/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Opus41/t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Opus41/t1/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Opus41/t2">./tests/SpaceInvaders/online/Opus41/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Opus41/t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Opus41/t2/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Qwen3code-online/t1">./tests/SpaceInvaders/online/Qwen3code-online/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Qwen3code-online/t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Qwen3code-online/t1/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Qwen3code-online/t2">./tests/SpaceInvaders/online/Qwen3code-online/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Qwen3code-online/t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Qwen3code-online/t2/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Sonnet45/t1">./tests/SpaceInvaders/online/Sonnet45/t1</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Sonnet45/t1/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Sonnet45/t1/thumb.png" style="vertical-align: middle;">
</a>


#### Experiment <a href="https://github.com/DrMicrobit/lllm_suit/blob/main/./tests/SpaceInvaders/online/Sonnet45/t2">./tests/SpaceInvaders/online/Sonnet45/t2</a>

<a href="https://drmicrobit.github.io/lllm_suit/./tests/SpaceInvaders/online/Sonnet45/t2/space_invaders.html">
  <img src="./tests/SpaceInvaders/online/Sonnet45/t2/thumb.png" style="vertical-align: middle;">
</a>


