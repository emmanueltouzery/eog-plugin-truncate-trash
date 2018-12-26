from gi.repository import GObject, Eog

class TruncateTrashPlugin(GObject.Object, Eog.WindowActivatable):
        # Override EogWindowActivatable's window property
        # This is the EogWindow this plugin instance has been activated for
        window = GObject.property(type=Eog.Window)

        def __init__(self):
                GObject.Object.__init__(self)

        def do_activate(self):
                print('The answer landed on my rooftop, whoa')

        def do_deactivate(self):
                print('The answer fell off my rooftop, woot')
