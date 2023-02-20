# Crappy File Uploader

This file uploader is meant for ancient versions of ComputerCraft where there is
no ability to upload files via drag-n-drop, and your crappy server admin has
disabled the HTTP library.

The limit per paste is 512 chars, so the minified version MUST stay within this
limit at all times. It should in theory be easy to do this, but we'll see.

This uses a program to run inside of minecraft along with a companion AutoHotKey
program to copy-paste your code to the game.