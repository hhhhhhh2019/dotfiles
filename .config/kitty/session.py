from typing import List
from kitty.boss import Boss

import json


def main(args: List[str]) -> str:
    # if args[1] == "save":
    #     name = "name" # input("Session name: ")
    #
    #     return f"save {name}"
    return "save name"


def handle_result(
        args: List[str], answer: str,
        target_window_id: int, boss: Boss) -> None:
    answer = answer.split(" ")

    w = boss.window_id_map.get(target_window_id)

    if w is None:
        return

    if answer[0] == "save":
        ls = boss.call_remote_control(w, ("ls", "--self"))

        result = ""

        windows = json.loads(ls)
        first_window = True

        for os_window in windows:
            # result += "launch --type=os-window\n"
            if not first_window:
                result += "new_os_window\n"
            first_window = False

            for tab in os_window["tabs"]:
                # result += "launch --type=tab\n"
                result += "new_tab\n"

                for window in tab["windows"]:
                    # result += "launch --type=window"
                    # result += "new_window"
                    # result += f" --cwd={window['cwd']}"

                    for process in window["foreground_processes"]:
                        result += f"launch --cwd={process['cwd']}"
                        for i in window["env"]:
                            result += f" --env {i}={window['env'][i]}"
                        result += f" {' '.join(process['cmdline'])}"
                        result += "\n"

    f = open(f"~/.local/state/kitty/sessions/{answer[1]}", "w")
    f.write(result)
    f.close()
