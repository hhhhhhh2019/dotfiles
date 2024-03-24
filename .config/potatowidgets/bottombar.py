from PotatoWidgets import Widget, get_screen_size, Poll
from colors import *

from notification import toggle_notification_center
from launcher import toggle_launcher

from time import strftime


time_poll = Poll(1, lambda: strftime("%H:%M:%S"))
date_poll = Poll(1, lambda: strftime("%d %b %Y"))


clock_box = Widget.Box(
    orientation = "v",
    valign   = "center",

    children = [
        Widget.Label(time_poll, css = "font-size: 20px;"),
        Widget.Label(date_poll),
    ]
)


apps_list = Widget.Box(
    valign   = "center",

    children = [
        Widget.Button(
            css = f"""
                background: transparent;
                padding: 5px;
            """,
            onclick = toggle_launcher,

            children = Widget.Icon("archlinux", size=40),
        )
    ]
)


notification_button = Widget.Button(
    valign   = "center",

    onclick = toggle_notification_center,

    css = f"""
        background: transparent;
        padding: 5px;
    """,

    children = Widget.Icon("notifications", size=40),
)


modules_left = [apps_list]
modules_center = []
modules_right = [clock_box, notification_button]


bottom_bar_window = Widget.Window(
    size      = [get_screen_size()[0], 56],
    layer     = "top",
    exclusive = True,
    position  = "bottom",
    namespace = "PotatoWidgets",

    children = Widget.Box(
        css = f"""
            background: {CrustAlpha};
            padding: 0px 2px;
        """,
        homogeneous = True,
        valign   = "fill",

        children = [
            Widget.Box(
                # css = f"""
                #     background: red;
                # """,
                children = modules_left,
                halign   = "start",
                valign   = "center",
                spacing  = 10,
            ),

            Widget.Box(
                # css = f"""
                #     background: green;
                # """,
                children = modules_center,
                halign   = "center",
                valign   = "center",
                spacing  = 10,
            ),

            Widget.Box(
                # css = f"""
                #     background: blue;
                # """,
                children = modules_right,
                halign   = "end",
                valign   = "center",
                spacing  = 10,
            ),
        ]
    )
)

bottom_bar_window.set_app_paintable(True)
