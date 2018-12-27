;; inspired by https://github.com/GNOME/eog-plugins/blob/master/plugins/export-to-folder/export-to-folder.py
;; and https://github.com/GNOME/eog-plugins/blob/master/plugins/slideshowshuffle/slideshowshuffle.py
(import [gi.repository [GObject Eog Gio]])
(import os)
(import time)

(defclass TruncateTrashPlugin [GObject.Object Eog.WindowActivatable]
  ;; Override EogWindowActivatable's window property
  ;; This is the EogWindow this plugin instance has been activated for
  [window (GObject.property :type Eog.Window)]

  (defn --init-- [self]
    (GObject.Object.--init-- self))

  (defn create-action [self action-name shortcut]
    (setv action (Gio.SimpleAction.new action-name))
    (action.connect "activate" self.truncate-trash-cb self.window)
    (setv app (Eog.Application.get-instance))
    (self.window.add-action action)
    (app.set-accels-for-action (+ "win." action-name) [shortcut None]))

  (defn do-activate [self]
    (self.create-action "TruncateTrash" "<Control>E"))

  (defn truncate-trash-cb [self action parameter window]
    (setv image (window.get-image))
    (if image (self.truncate-trash-image image window)))

  (defn truncate-trash-image [self image window]
    (setv image-path (-> image .get-file .get-path))
    (.activate (window.lookup-action "move-trash"))
    (os.system (+ "touch " image-path)))

  (defn do-deactivate [self]))
