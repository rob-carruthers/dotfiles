#!/usr/bin/bash
 
MONITOR_MODEL="G24-10"
HZ=143.998993
RESOLUTION="1920x1080"
IDLE_TIMEOUT=300

startup() {
    set -x
    # killall -9 pipewire; pipewire &
    # killall -9 pipewire-pulse; pipewire-pulse &
    # killall -9 wireplumber; wireplumber &

    if [[ $HOSTNAME == "rob-pc" ]]; then
        output=$(wlr-randr | grep -E "^DP.*$MONITOR_MODEL" | cut -d " " -f1)
        wlr-randr --output "$output" --mode "$RESOLUTION@$HZ"

        # killall -9 mpd; mpd &
        /home/rob/.cargo/bin/ch57x-keyboard-tool upload ~/.config/utility-keys/utility-keys.yaml &
    fi

    while [ ! -S "${XDG_RUNTIME_DIR}/wayland-0" ]; do
        sleep 0.05
    done

    killall swayidle; swayidle -w timeout $IDLE_TIMEOUT '/bin/bash -c '\''gtklock & sleep 0.5; wlopm --off \*'\''' resume 'wlopm --on \*' &
}

export MONITOR_MODEL HZ RESOLUTION IDLE_TIMEOUT
export -f startup
export DBUS_SESSION_BUS_ADDRESS=$(systemctl --user show-environment | grep -oP 'DBUS_SESSION_BUS_ADDRESS=\K.*')
unset DBUS_SESSION_BUS_PID
killall -q uv
trap 'kill -9 0' EXIT
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export XCURSOR_THEME=phinger-cursors-dark
export XCURSOR_SIZE=24

(uv run --directory /home/rob/code/pysomebar pysomebar | dwl -d -s "bash -c startup") &> ~/dwl.log
