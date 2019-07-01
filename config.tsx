// Created:     2019/00/00 00:00:00
// Last Change: 2019/07/01 11:36:48.

import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input  // {{{
    // Add input bindings here:
    // oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    // Or remove the default bindings here by uncommenting the below line:
    // oni.input.unbind("<c-p>")
    // }}}

    oni.input.unbindAll()
    oni.input.unbind("<C-p>")
    oni.input.unbind("<S-C-p>")
    const isNormalMode =
        () => oni.editors.activeEditor.mode === "normal"
    oni.input.bind("<C-:>", "commands.show", isNormalMode)
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    // add custom config here, such as
    "ui.colorscheme": "iceberg",

    "oni.bookmarks": ["~/Dotfiles"],
    "oni.loadInitVim": true,
    "oni.useDefaultConfig": false,

    "editor.fontSize": "18px",
    "editor.fontFamily": "Cica, Dejavu Sans Mono, Consolas",

    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",

    "editor.errors.slideOnForce": false,
    "editor.fontLigatures": true,
    "editor.fontWeight": "normal",
    "editor.linePadding": 1,
    "editor.quickInfo.enabled": false,
    "editor.scrollBar.visible": false,

    "autoClosingPairs.enabled": false,
    "commandline.mode": true,
    "oni.hideMenu": true,
    "sidebar.enabled": false,
    "statusbar.enabled": true,
    "tabs.mode": "native",
}
