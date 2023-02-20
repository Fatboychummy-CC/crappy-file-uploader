# Crappy File Uploader

This file uploader is meant for ancient versions of ComputerCraft where there is
no ability to upload files via drag-n-drop, and your crappy server admin has
disabled the HTTP library.

The limit per paste is 512 chars, so the minified version MUST stay within this
limit at all times. It should in theory be easy to do this, but we'll see.

This uses a program to run inside of minecraft along with a companion AutoHotKey
program to copy-paste your code to the game.

# Usage

1. On your CC computer, run `edit uploader.lua`.
2. Copy the contents of `minified-copy-pasteable.lua`.
3. Paste into the computer.
4. Hit CTRL, then S to save. Hit CTRL, then E to exit.
5. Run `uploader yourfilenamehere.lua`
6. Ensure you have autohotkey installed.
7. Run the companion autohotkey program.
8. Press 'a' when ready, it will prompt you to select your ComputerCraft window
then your editor window.
9. Select 'OK', then select the topmost line of the file you want to copy in
your editor.
10. When done, hold 'q' until it stops.
11. Press 'q' ingame to save the file.