Complete fail.
1. Even when restricting context window to 30k tokens, the model spilled over to RAM (~5 GiB) and CPU. Despite having ~3 GiB VRAM free on each card (~6 GiB total). Maybe more an Ollama problem.
2. Tool calling seems to fail, cline cannot parse the output in a way that allows meaningful interaction. No index.html created.