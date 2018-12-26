(import [gi.repository [GObject Eog Gio]])

(defclass TruncateTrashPlugin [GObject.Object Eog.WindowActivatable]
  ;; Override EogWindowActivatable's window property
  ;; This is the EogWindow this plugin instance has been activated for
  [window (GObject.property :type Eog.Window)]

  (defn --init-- [self]
    (GObject.Object.__init__ self))

  (defn create-action [self action-name shortcut]
    (setv action (Gio.SimpleAction.new action-name))
    (action.connect "activate" self.truncate_trash_cb self.window)
    (setv app (Eog.Application.get_instance))
    (self.window.add_action action)
    (app.set_accels_for_action (+ "win." action-name) ["E" None]))

  (defn do-activate [self]
    (self.create-action "TruncateTrash" "E")
    (print "The answer landed on my rooftop, whoa"))

  (defn truncate-trash-cb [self action parameter window]
    (print "truncate & trash!"))

  (defn do-deactivate [self]
    (print "The answer fell off my rooftop, woot")))
