First round a total failure. Model rambling forever ("Wait, maybe the user meant ..."), destroying previously written code.

Experiment stopped after 10 minutes.

Next trial with following prompt: Implement the game given in @/designdoc.md . Do not ask the user if not absolutely necessary, follow the hits given by the agent.

Produced syntactically wrong code after 3 or 4 minutes ("if (AABB collision(bullet, target)) { ..."). Trying to fix that ... led to the thing spiraling out of control, adding free flow text into code, which led to further syntax errors which it could not fix and so on.

Stopped experiment after 50 minutes.