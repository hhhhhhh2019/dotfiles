from PotatoWidgets import Applications, Variable, Widget, wait
from PotatoWidgets import GtkLayerShell, Gdk

from colors import *



def open_launcher():
    launcher_window.open()

    apps_box.set_children([create_button(app) for app in Applications().all()])

    entry_box.get_children()[0].grab_focus()

    wait(0, lambda: launcher_rev.set_revealed(True))


def close_launcher():
    launcher_rev.set_revealed(False)

    wait(150, lambda: launcher_window.close())


def toggle_launcher():
    if launcher_window.is_visible():
        close_launcher()
    else:
        open_launcher()


def create_button(entry):
    launch = lambda: (
        entry.launch(),
        close_launcher(),
        query.set_value(""),
        entry_box.get_children()[0].set_text("")
    )


    btn = Widget.Button(
        css = f"""
            padding: 8px;
            margin: 2px;
            background: transparent;
        """,
        onclick  = launch,
        children = Widget.Box(
            children = [
                Widget.Icon(entry.icon_name, 32),
                Widget.Label(entry.name.title())
            ]
        )
    )

    rev = Widget.Revealer(
        children   = btn,
        transition = "slideup",
        duration   = 250,
        reveal     = True,
        attributes = lambda self: (
            setattr(self, "keywords", entry.keywords),
            setattr(self, "launch", launch),
            self.bind(
                query,
                lambda query: self.set_revealed(str(query).lower() in self.keywords),
            ),
        ),
    )

    return rev



query = Variable("")


entry_box = Widget.Box(
    children = Widget.Entry(
        hexpand     = True,
        placeholder = "Search...",
        onchange    = query.set_value,
        onenter     = lambda text: next(
            app.launch()
            for app in apps_box.get_children()
            if str(text).lower() in app.keywords
        ),
    ),
)


apps_box = Widget.Box(
    orientation = "v",
    vexpand     = True,
)


launcher_box = Widget.Box(
    css = f"""
        background:    {Crust};
        border:        1px solid {Surface1};
        border-radius: 15px;
        padding:       15px;
    """,
    size        = [800,600],
    orientation = "v",
    spacing     = 10,
    valign      = "fill",

    children = [
        entry_box,
        Widget.Separator(),
        Widget.Scroll(hexpand=True, vexpand=True, children=apps_box),
    ]
)


launcher_rev = Widget.Revealer(
    children   = launcher_box,
    transition = "slideup",
    duration   = 250,
    reveal     = False,
)


launcher_window = Widget.Window(
    size     = [800,600],
    position = "bottom",
    at       = {"bottom": 10},

    children = Widget.Box(
        css = f"""
            background: transparent;
        """,
        valign   = "end",
        children = launcher_rev,
    )
)

launcher_window.set_app_paintable(True) # transparent background


# wait(10, open_launcher)


# notifications_center_window.set_can_focus(True)
GtkLayerShell.set_keyboard_mode(launcher_window, 2)
launcher_window.connect("key-press-event", lambda _, e: (
    close_launcher() if e.get_keyval()[1] == Gdk.KEY_Escape else None
))
launcher_window.connect("focus-out-event", lambda *_: close_launcher())
