from PotatoWidgets import FILE_CACHE_NOTIF, Widget, get_screen_size, lookup_icon, wait
from PotatoWidgets.Services import Notification, NotificationsService

from PotatoWidgets import GtkLayerShell

from colors import *


NS = NotificationsService()



def create_popup(notif, on_close):
    if notif == None:
        return


    if notif.image:
        if notif.image.endswith((".png", ".jpg")):
            image = Widget.Box(
                css=f"""
                    background-size:     cover;
                    background-repeat:   no-repeat;
                    background-position: center;
                    background-image:    url("{notif.image}");
                    """,
                size = 100,
            )
        else:
            image = Widget.Icon(notif.image, 64)
    else:
        image = Widget.Icon(notif.name, 64)


    body = Widget.Box(
        orientation = "v",
        valign      = "start",
        spacing     = 10,
        children    = [
            Widget.Label(
                notif.summary,
                wrap = True,
                justify = "left",
                css = f"color: {Subtext1}; font-size: 18px;"
            ),
            Widget.Label(
                notif.body,
                wrap = True,
                justify = "left",
                css = f"color: {Text}; font-size: 14px;"
            ),
        ],
    )


    if notif.actions:
        actions = Widget.Box(
            orientation = "v",
            homogeneous = True,
            spacing = 5,
            children = [
                (lambda action: Widget.Button(
                    onclick = lambda: notif.action(action["id"]),
                    children = Widget.Label(action["label"]),
                ))(i) for i in notif.actions
            ]
        )
    else:
        actions = None


    box = Widget.Box(
        orientation = "h",
        spacing = 10,
        valign = "center",

        css = "padding: 0 10px 10px 10px;",

        children = [
            image,
            Widget.Box(
                orientation = "v",
                spacing = 10,
                hexpand = True,

                children = [
                    body,
                    actions
                ]
            )
        ]
    )


    rev = Widget.Revealer(
        children   = box,
        transition = "slidedown",
        duration   = 100,
        reveal     = False,
    )

    wait(1, lambda: rev.set_revealed(True))


    menu = Widget.Box(
        halign = "end",
        hexpand = True,

        children = [
            Widget.Button(
                css = f"""
                    padding: 2px;
                    background: transparent;
                """,

                children = Widget.Icon("window-close", size=24),

                onclick = lambda: on_close(res)
            )
        ]
    )


    res = Widget.Box(
        css = f"""
            background: {Crust};
            border-radius: 10px;
        """,
        attributes = lambda self: setattr(self, "id", notif.id),

        orientation = "v",
        halign = "fill",
        children = [
            menu,
            rev
        ]
    )


    return res


def hide_notification(wnd):
    wnd.get_children()[1].set_revealed(False)

    wait(100, lambda: notifications_popup_box.set_children(
        [i for i in notifications_popup_box.get_children() if i != wnd]
    ))


def update_notification_center():
    notif_list.set_children(
            [create_popup(i, lambda wnd: NS.close_notification(wnd.id)) for i in NS.notifications]
    )


def open_notification_center():
    [NS.dismiss_notification(i.id) for i in NS.popups]

    notifications_popup_window.close()
    notifications_center_window.open()
    # notifications_center_window.grab_focus()

    wait(0, lambda: notifications_center_rev.set_revealed(True))

    update_notification_center()


def close_notification_center():
    notifications_popup_window.open()

    notifications_center_rev.set_revealed(False)

    wait(250, notifications_center_window.close)


def toggle_notification_center():
    if notifications_center_window.is_visible():
        close_notification_center()
    else:
        open_notification_center()




notifications_popup_box = Widget.Box(
    css = f"""
        background: transparent;
    """,
    orientation = "v",
    valign = "end",
    spacing = 10,
)


notifications_popup_window = Widget.Window(
    size = [450, get_screen_size()[1]],
    position = "bottom right",
    at = {"bottom": 10, "right": 10},

    children = notifications_popup_box,
)

notifications_popup_window.set_app_paintable(True) # transparent background



notif_list = Widget.Box(
    css = "padding: 0 20px 0 0;",
    orientation = "v",
    valign = "start",
    hexpand = True,
)


notifications_center_box = Widget.Box(
    css = f"""
        background: {Crust};
        border-radius: 10px;
        border: 1px solid {Surface1};
        padding: 10px;
    """,
    orientation = "v",
    size = [500, 600],
    spacing = 10,

    children = [
        Widget.CheckBox(
            onclick = lambda: setattr(NS, "dnd", not NS.dnd),
            children = Widget.Box(
                spacing = 5,
                children = [
                    Widget.Icon("notifications-disabled", size = 24),
                    Widget.Label("do not disturb", css="font-size: 16px;")
                ],
            ),
        ),

        Widget.Separator(),

        Widget.Box(
            hexpand = True,
            vexpand = True,
            orientation = "v",
            spacing = 10,
            children = [
                Widget.Box(
                    hexpand = True,
                    spacing = 5,
                    children = [
                        Widget.Label("Notifications", css="font-size: 20px;", hexpand = True),
                        Widget.Button(
                            onclick = lambda: (NS.clear(), update_notification_center()),
                            children = Widget.Label("Clear all")
                        )
                    ]
                ),
                Widget.Scroll(
                    vexpand = True,
                    children = notif_list
                )
            ]
        ),
    ]
)

notifications_center_box.get_children()[0].set_active(NS.dnd)


notifications_center_rev = Widget.Revealer(
    children   = notifications_center_box,
    transition = "slideup",
    duration   = 250,
    reveal     = False,
)

notifications_center_window = Widget.Window(
    size = [400, 600],
    position = "bottom right",
    at = {"bottom": 10, "right": 10},

    children = Widget.Box(
        css = f"""
            background: transparent;
        """,
        valign = "end",
        children = notifications_center_rev
    )
)

notifications_center_window.set_app_paintable(True) # transparent background

notifications_center_window.connect("key-press-event", lambda *a: print(a))
notifications_center_window.connect("focus-out-event", lambda *_: close_notification_center())

# wait(0, toggle_notification_center)



NS.connect("popup", lambda instance, id: (
    notifications_popup_box.add(create_popup(
        instance.get_popup(id), lambda wnd: hide_notification(wnd))),
    update_notification_center()))

def dismiss(_, id):
    for i in notifications_popup_box.get_children():
        if i.id != id:
            continue

        hide_notification(i)
        break

NS.connect("dismissed", dismiss)


def close(_, id):
    wnd = None

    for i in notif_list.get_children():
        if i.id == id:
            wnd = i
            break

    if wnd == None:
        return

    wnd.get_children()[1].set_revealed(False)


    wait(100, lambda: notif_list.set_children(
        [i for i in notif_list.get_children() if i != wnd]
    ))


NS.connect("closed", close)
