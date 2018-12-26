;; inspired by https://github.com/GNOME/eog-plugins/blob/master/plugins/export-to-folder/export-to-folder.py
(import [gi.repository [GObject Eog Gio]])
(import os)

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
    (self.create-action "TruncateTrash" "E")
    (print "The answer landed on my rooftop, whoa"))

  (defn truncate-trash-cb [self action parameter window]
    (setv image (window.get-image))
    (if image (self.truncate-trash-image image)))

  (defn truncate-trash-image [self image]
    (setv image-path (-> image .get-file .get-path))
    (os.system (+ "gio trash " image-path))
    (os.system (+ "touch " image-path)))

  (defn do-deactivate [self]
    (print "The answer fell off my rooftop, woot")))
