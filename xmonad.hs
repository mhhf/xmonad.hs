import XMonad
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders

main = do
xmonad $ defaultConfig
	{
	terminal = "urxvtc",
	borderWidth = 3,
	focusedBorderColor = "#0000FF",
	normalBorderColor = "#808080",
	modMask = mod1Mask,
	layoutHook = Tall 1 (1/100) (1/2) ||| smartBorders Full
	}

	`additionalKeysP`
	[
	("M-w", spawn "firefox"),
	("M-<F4>", kill),
	("<Print>", spawn "scrot /$HOME/work/screenshot/%Y%m%d-%H%M%S.png"),
	("C-<Print>", spawn "scrot /$HOME/work/screenshot/%Y%m%d-%H%M%S.png -u")
	]

