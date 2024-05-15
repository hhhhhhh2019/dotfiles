from PotatoWidgets import Widget, NotificationsService, Poll, DIR_CONFIG_POTATO
from datetime import datetime
from utils.hypr import get_option


Date = Widget.Box(
    orientation="v",
    valign="center",
    spacing=0,
    children=[
        Widget.Label(
            Poll("1s", lambda: datetime.now().strftime("%H:%M:%S")),
            classname="date_time",
        ),
        Widget.Label(
            Poll("1m", lambda: datetime.now().strftime("%Y/%m/%d")),
            classname="date_date",
        )
    ]
)


NotifButton = Widget.Revealer(
    transition="slideleft",
    reveal=False,
    duration=250,
    attributes=lambda self: NotificationsService().connect(
        "count",
        lambda _, count: self.set_revealed(bool(count)),
    ),

    children=Widget.Button(
        classname="module notif_indicator",
        children=Widget.Label(
            text=NotificationsService().bind("count"),
        )
    )
)


KbLayout = Widget.Button(
    classname="module kb_layout",
    children=Widget.Label(
        get_option("input:kb_layout")
    )
)


StartBox = Widget.Box(
    hexpand=True,
)


CenterBox = Widget.Box(
    spacing=10,
    hexpand=True,
    children=[
        Widget.Button(
            classname="module",
            children=Widget.Image(
                f"{DIR_CONFIG_POTATO}/scss/images/icons/hyprland.svg", 40
            )
        )
    ]
)

EndBox = Widget.Box(
    hexpand=True,
    children=[
        NotifButton,
        Date,
        KbLayout,
    ]
)


BottomBar = Widget.Window(
    namespace="BottomBar",
    size=["100%", 40],
    position="bottom",
    layer="top",
    exclusive=True,
    children=Widget.CenterBox(
        classname="bottombar",
        start=StartBox,
        center=CenterBox,
        end=EndBox,
    )
)
