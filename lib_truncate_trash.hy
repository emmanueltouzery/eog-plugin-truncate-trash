(import [gi.repository [GObject Eog]])

(defclass TruncateTrashPlugin [GObject.Object Eog.WindowActivatable]
  ;; Override EogWindowActivatable's window property
  ;; This is the EogWindow this plugin instance has been activated for
  [window (GObject.property :type Eog.Window)]

  (defn --init-- [self]
    (GObject.Object.__init__ self))

  (defn do_activate [self]
    (print "The answer landed on my rooftop, whoa"))

  (defn do_deactivate [self]
    (print "The answer fell off my rooftop, woot")))
