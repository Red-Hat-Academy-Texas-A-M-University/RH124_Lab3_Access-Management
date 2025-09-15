# Lab 2 Overview

**From:** Owen Shadburne <oshadburne@company.internal>  
**To:** [Employee Name]  
**Subject:** Organizing the `~/files` Directory

Howdy!

The `~/files` directory on the production system has gotten pretty cluttered. The dev team didn’t coordinate on file 
placement, and it’s starting to become a headache for everyone trying to navigate it.

Here’s the plan to bring it back under control:

1. **Clean up empties:** Remove any directories that are either completely empty or only contain empty files.

2. **Consolidate files:** Move all existing files you can find into `~/files/logs`.  
   - **Exception:** If a file’s name begins with `!critical`, **copy** it into `~/files/logs` instead of moving it.

3. **Handle symbolic links:** There’s a symbolic link at the root of `~/files` pointing somewhere deeper inside the 
structure. Make sure this link is re-created after the reorganization and points to the same target.

4. **Report total size:** Once all files are consolidated, create a file called `size.txt` in `~/files/logs` containing 
the **total combined size** (in bytes) of every file in that directory.


This cleanup will help standardize our file structure and make it easier to find important logs. Please complete this 
before the end of the day.

Thanks and Gig 'em,  
**Owen Shadburne**  
Infrastructure Manager



