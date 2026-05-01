config.load_autoconfig(False)
config.set("auto_save.session", True)
config.set("changelog_after_upgrade", "patch")
config.set("colors.completion.match.fg", "#D79784")
config.set("colors.hints.bg", "#E7C173")
config.set("colors.hints.fg", "#222630")
config.set("colors.messages.error.bg", "#BF616A")
config.set("colors.statusbar.normal.bg", "#222630")
config.set("colors.statusbar.normal.fg", "#97B67C")
config.set("colors.statusbar.url.fg", "#A3BE8C")
config.set("colors.statusbar.url.success.http.fg", "#A3BE8C")
config.set("colors.statusbar.url.success.https.fg", "#A3BE8C")
config.set("colors.tabs.bar.bg", "#222630")
config.set("colors.tabs.even.bg", "#60728A")
config.set("colors.tabs.odd.bg", "#434C5E")
config.set("colors.tabs.selected.even.bg", "#1E222A")
config.set("colors.tabs.selected.odd.bg", "#1E222A")
config.set("fonts.default_family", "JetBrainsMono Nerd Font Mono")
config.set("fonts.default_size", "11px")
config.set("search.wrap", False)
config.set("tabs.new_position.related", "next")
config.set("tabs.new_position.unrelated", "next")
config.set("zoom.default", "90%")
config.bind("gw", "hint all")
config.bind("<ctrl-o>", "back")
config.bind("<ctrl-i>", "forward")
config.bind("<ctrl-r>", "reload")
config.bind("<alt-w>", "tab-close")
config.bind("<alt-PgUp>", "tab-prev")
config.bind("<alt-PgDown>", "tab-next")
c.hints.selectors["all"] = [
  "a",
  "area",
  "textarea",
  "select",
  "input:not([type=hidden])",
  "button",
  "label",
  "[onclick]",
  "[onmousedown]",
  "[role=link]",
  "[role=button]",
  "*[tabindex]",
]
