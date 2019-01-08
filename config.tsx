
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input  // {{{
    //
    // Add input bindings here:
    //
    // oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
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

    // "ui.colorscheme": "nord",
    "ui.colorscheme": "iceberg",

    // "oni.useDefaultConfig": true,
    // "oni.bookmarks": ["~/Documents"],
    // "oni.loadInitVim": false,
    // "editor.fontSize": "12px",
    // "editor.fontFamily": "Monaco",
    "editor.fontSize": "20px",

    // UI customizations
    // "ui.animations.enabled": true,
    // "ui.fontSmoothing": "auto",

    "autoClosingPairs.enabled": false,
    "commandline.mode": true,
    // "commandline.mode": false,
    "editor.errors.slideOnForce": false,
    "editor.fontFamily": "Cica, Dejavu Sans Mono, Consolas",
    "editor.fontLigatures": true,
    // "editor.fontLigatures": false,
    // "editor.fontSize": "11px",
    "editor.fontWeight": "normal",
    "editor.linePadding": 1,
    "editor.quickInfo.enabled": false,
    "editor.scrollBar.visible": false,
    "oni.loadInitVim": true,
    "oni.hideMenu": true,
    "oni.useDefaultConfig": false,
    "sidebar.enabled": false,
    "statusbar.enabled": true,
    // "statusbar.enabled": false,
    "tabs.mode": "native",
    "ui.animations.enabled": true,
    // "ui.colorscheme": "onedark",
    "ui.fontSmoothing": "auto",
    }
