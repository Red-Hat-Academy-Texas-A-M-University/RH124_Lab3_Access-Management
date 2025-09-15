**From:** Devon Kim <dkim@company.internal>  
**To:** [Employee Name]  
**Subject:** About the `~/files` mess

Hey,

Sorry about the chaos in `~/files`. I ran the start script to bootstrap some testing stuff, but I didn’t really think about where things were landing.

Anyway, the main thing is: a bunch of directories got created (some are empty, some have random junk), and there’s even a symlink dropped at the root pointing to one of the nested files.  

If you could:

- get rid of any empty dirs (or dirs that only have empty placeholder files),
- toss every actual file you find into a `logs` folder inside `~/files` (if it’s named with `!critical` at the start, don’t move it — just copy it so it stays put),
- and then make sure that symlink at the root is recreated afterward so it still points to the same file it did before…

…that should put things back in order.  

Oh, and Morgan wants a `size.txt` in `~/files/logs` with the combined size of everything in there when you’re done.

Appreciate it,  
**Devon**
