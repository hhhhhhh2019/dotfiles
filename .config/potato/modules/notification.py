from PotatoWidgets import NotificationsService, Notification
from PotatoWidgets import Widget, wait


def GenerateNotificationPopup(notif: Notification):
    if notif is None:
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
                size=100,
            )
        else:
            image = Widget.Icon(notif.image, 64)
    else:
        image = Widget.Icon(notif.name, 64)

    body = Widget.Box(
        orientation="v",
        valign="start",
        spacing=10,
        children=[
            Widget.Label(
                notif.summary,
                wrap=True,
                justify="left",
            ),
            Widget.Label(
                notif.body,
                wrap=True,
                justify="left",
            ),
        ],
    )

    if notif.actions:
        actions = Widget.Box(
            orientation="v",
            homogeneous=True,
            spacing=5,
            children=[
                (lambda action: Widget.Button(
                    onclick=lambda: notif.action(action["id"]),
                    children=Widget.Label(action["label"]),
                ))(i) for i in notif.actions
            ]
        )
    else:
        actions = None

    box = Widget.Box(
        orientation="h",
        spacing=10,
        valign="center",

        css="padding: 0 10px 10px 10px;",

        children=[
            image,
            Widget.Box(
                orientation="v",
                spacing=10,
                hexpand=True,

                children=[
                    body,
                    actions
                ]
            )
        ]
    )

    rev = Widget.Revealer(
        children=box,
        transition="slidedown",
        duration=100,
        reveal=False,
    )

    wait(1, lambda: rev.set_revealed(True))

    menu = Widget.Box(
        halign="end",
        hexpand=True,

        children=[
            Widget.Button(
                css="""
                    padding: 2px;
                    background: transparent;
                """,

                children=Widget.Icon("window-close", size=24),

                # onclick = lambda: on_close(res)
            )
        ]
    )

    res = Widget.Box(
        css="""
            border-radius: 10px;
        """,
        attributes=lambda self: setattr(self, "id", notif.id),

        orientation="v",
        halign="fill",
        children=[
            menu,
            rev
        ]
    )

    return res


notifservice = NotificationsService()

NotificationPopupWindow = Widget.Window(
    position="top right",
    layer="overlay",
    size=[0, 0],
    attributes=lambda self: (
        notifservice.connect(
            "popups",
            lambda _, c: (
                self.set_visible(True)
                if bool(c)
                else wait(
                    500, self.set_visible, False
                )
            ),
        )
    ),
    children=Widget.Box(
        orientation="v",
        hexpand=True,
        vexpand=True,
        valign="end",
        attributes=lambda self: (
            notifservice.connect(
                "popup",
                lambda service, id: self.add(
                    GenerateNotificationPopup(service.get_popup(id))
                ),
            ),
            notifservice.connect(
                "dismissed",
                lambda _, id: (
                    wait(
                        500,
                        self.remove,
                        next((i for i in self.get_children() if i.id == id), None),
                    ),
                ),
            ),
        ),
    ),
)
