# dreamy-dot-files
My personal dot files

Some people were interested in seeing my dot files when I was live streaming from https://www.livecoding.tv/still_dreaming_1/. It will also be useful for me to be able to clone these to other machices or fresh OS installs. I have not decided if I will spend time reviewing pull requests, probably depends on how many this gets. I am more interested in keeping this useful for me than being general settings that would be good for everyone.

<b>Installation instructions</b>

1) clone this repository to a new directory

2) Compare the files and directories in the clone to the files in your home. Make backup copies of anything in your home that also exists in the clone.

3) Delete the files and directories in your home that also exist in the clone.

4) Copy the .git directory from the clone to your home

5) Run `git status` from your home. Anything showing up as modified is a file you failed to backup and delete in the previous steps. Do this now.

6) Run `git checkout .` from your home.

7) Run `git status` from your home. You should have a clean working directory.

8) Delete the original clone directory, probably named dreamy-dot-files. You don't need it because your home directory is also a clone now.
