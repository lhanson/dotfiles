#!/usr/bin/python
# Sets up the users's dotfiles as links to the git-versioned ones in this directory.
# It wouldn't be tough to just scan the dotfiles dir to see what matches up
# with a dotfile in ~ and link based on that, but for now I'm explicitly
# listing which files to track.

import os
import shutil
import subprocess

homeDirName = os.getenv("HOME")
dotfilesDirName = os.path.abspath(os.path.dirname(__file__))
backupDirName = dotfilesDirName + "/backup"

# Paths from the home directory which will be mapped into this repo.
# Key is the dotfile in the home directory, the value is location in the
# dotfiles directory where the file will be stored (and linked to)
fileMap = dict([
                (".ackrc",            "ackrc"),
                (".bash_profile",     "bash/bash_profile"),
                (".config",           "config"),
                (".gvimrc",           "vim/gvimrc"),
                (".git-completion",   "git/git-completion.bash"),
                (".gitconfig",        "git/gitconfig"),
                (".gitignore_global", "git/gitignore_global"),
                (".screenrc",         "screenrc"),
                (".vim",              "vim"),
                (".vimrc",            "vim/vimrc"),
                ])

if not os.path.exists(backupDirName):
    print "\nCreating backup directory at " + backupDirName
    os.mkdir(backupDirName)
else:
    print "\nUsing existing backup directory at " + backupDirName

for k,v in fileMap.iteritems():
    if os.path.exists(homeDirName + "/" + k):
        print "Moving existing " + k + " to " + backupDirName + "/" + k
        shutil.move(homeDirName + "/" + k, backupDirName)
    print "Linking " + dotfilesDirName + "/" + v + " as " + homeDirName + "/" + k
    if not os.path.exists(os.path.dirname(homeDirName + "/" + k)) :
        print "Creating directory " + os.path.dirname(homeDirName + "/" + k)
        os.makedirs(os.path.dirname(homeDirName + "/" + k))
    os.symlink(dotfilesDirName + "/" + v, homeDirName + "/" + k)

print "Configuring global git ignore file"
subprocess.call(["git", "config", "--global", "core.excludesfile", "~/.gitignore_global"])
