A GNOME eye of gnome plugin.

https://wiki.gnome.org/Apps/EyeOfGnome/Plugins

This plugin adds a new control+e shortcut. That action moves the current picture
to the trash and then creates an empty file where the picture was.

This is useful to me because I sync pictures from my camera over wifi, and
the camera keeps resending old pictures if it doesn't find them on my disk.
I may want to keep the pictures on my camera but not on my computer anymore.

In this case I can have an empty file on the computer to prevent the camera
from resending while freeing up some disk space.

I can later (when I remove the pictures on the camera) remove the leftover empty
files with:

    find -type f -empty -delete
