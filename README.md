# dreamy-dot-files
My personal dot files

Some people were interested in seeing my dot files. It will also be useful for me to be able to clone these to other machices or fresh OS installs. I have not decided if I will spend time reviewing pull requests, probably depends on how many this gets. I am more interested in keeping this useful for me than being general settings that would be good for everyone.

<b>Installation instructions</b>

The develop branch is compatible with the develop branch of my Vim plugins. The master branch is compatible with the master branch of my Vim plugins. I only update the master branch here when I update the master branch on my plugins.

1) clone this repository to a new directory

2) Copy the .git directory from the clone to your home

3) Run `git status` from your home. Anything showing up as modified is a file you will be overwriting shortly. Make backup copies of these files. As a way of making sure you didn't miss anything. Delete each file after backing it up. Each time you delete one of these files, `git status` should show one less modified file. Once `git status` no longer shows any modified files, you are ready to move on to the next step.

6) Run `git checkout .` from your home.

7) Run `git status` from your home. You should have a clean working directory.

8) Delete the original clone directory, probably named dreamy-dot-files. You don't need it because your home directory is also a clone now.
