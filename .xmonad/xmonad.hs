import XMonad
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Config.Gnome

import qualified Data.Map as M

main = xmonad $ defaultConfig
        { terminal           = "terminal"
        , modMask            = mod4Mask
        , borderWidth        = 1
        , focusFollowsMouse  = True
        , workspaces         = ["1","2","3","4","5","6","7","8","9"]
        , normalBorderColor  = "#000000"
        , focusedBorderColor = "#293739"
        , layoutHook         = avoidStruts $ layouts
        , manageHook         = manageDocks <+> management
        , startupHook        = gnomeRegister >> startup
        }

        `additionalKeysP`

        [ ("M-S-<Return>", spawn "terminal")
        , ("M-S-q", spawn "dialog-quit")
        , ("M-S-r", spawn "dialog-reboot")
        , ("M-S-h", spawn "dialog-shutdown")
        , ("M-b", sendMessage ToggleStruts)
        , ("M-p", spawn "dmenu_run -nb '#161616' -nf '#666666' -sb '#66d9ef' -sf '#000000' -i -b -fn Monospace-13")
        , ("M-e", spawn "emacs")
        , ("M-v", spawn "gvim")
        , ("M-f", spawn "nautilus")
        , ("M-w", spawn "firefox")
        , ("M-S-t", spawn $ "terminal -e htop")
        , ("M-S-s", spawn $ "gnome-control-center sound")
        , ("M-S-l", spawn "xscreensaver-command -lock")
        ]

layouts = smartBorders tiled          |||
          smartBorders (Mirror tiled) |||
          noBorders Full              |||
          simpleTabbed
    where
        -- default tiling algorithm partitions the screen into two panes
        tiled   = Tall nmaster delta ratio
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by master pane
        ratio   = 1/2
        -- Percent of screen to increment by when resizing panes
        delta   = 3/100

management = composeAll
        [ className =? "Zenity"         --> doFloat
        , resource  =? "desktop_window" --> doIgnore
        ]

startup = setWMName "LG3D" -- JVM workaround.
