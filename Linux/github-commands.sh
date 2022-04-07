#!/bin/bash

#Run Git commands to update github
git config core.autocrlf true

git pull
git add .
git commit -m "Added by Bash"
git push

