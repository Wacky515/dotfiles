// Created:     2021/02/28 12:52:39
// Last Change: 2021/02/28 13:12:54.

"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
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
    oni.input.unbindAll();
    oni.input.unbind("<C-p>");
    oni.input.unbind("<S-C-p>");
    var isNormalMode = function () { return oni.editors.activeEditor.mode === "normal"; };
    oni.input.bind("<C-:>", "commands.show", isNormalMode);
};

exports.deactivate = function (oni) {
    console.log("config deactivated");
};

exports.configuration = {
    // add custom config here, such as
    "oni.useDefaultConfig": true,
    // "oni.useDefaultConfig": false,
    "oni.loadInitVim": true,
    // "oni.loadInitVim": false,
    "oni.bookmarks": ["~/Documents"],

    "commandline.mode": true,
    // "commandline.mode": false,
    "editor.errors.slideOnForce": false,
    "tabs.mode": "native",

    // UI customizations
    "ui.colorscheme": "iceberg",
    // "ui.colorscheme": "nord",
    // "ui.colorscheme": "onedark",
    "ui.fontSmoothing": "auto",
    "ui.animations.enabled": true,

    "editor.fontFamily": "Cica, Dejavu Sans Mono, Consolas",
    // "editor.fontFamily": "Monaco",
    "editor.fontSize": "20px",
    // "editor.fontSize": "11px",
    "editor.fontWeight": "normal",
    "editor.fontLigatures": true,
    // "editor.fontLigatures": false,
    "editor.linePadding": 1,
    "editor.quickInfo.enabled": false,
    "editor.scrollBar.visible": false,

    "autoClosingPairs.enabled": false,
    "oni.hideMenu": true,
    "statusbar.enabled": true,
    // "statusbar.enabled": false,
    "sidebar.enabled": false,
};
