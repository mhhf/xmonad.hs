import XMonad
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.KeyRemap
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import XMonad.Hooks.ICCCMFocus as ICCCMFocus

colorBlue = "#857da9"
colorGreen = "#88b986"
colorGray = "#676767"
colorWhite = "#d3d7cf"
colorGrayAlt = "#313131"
colorNormalbg = "#1a1e1b"

{-wsPP = xmobarPP
	{
	ppOrder = \(ws:l:t:_) -> [ws, t],
	ppCurrent = xmobarColor colorGreen colorNormalbg,
	ppUrgent = xmobarColor colorWhite colorNormalbg,
	ppVisible = xmobarColor colorWhite colorNormalbg,
	ppHidden = xmobarColor colorWhite colorNormalbg,
	ppHiddenNoWindows = xmobarColor colorGray colorNormalbg,
	ppTitle = xmobarColor colorWhite colorNormalbg,
	ppWsSep = "",
	ppSep = "  ::: "
	-}

--tm = do
	{-
	--setDefaultKeyRemap emptyKeyRemap [emap]
	--setKeyRemap $ KeymapTable [((controlMask, xK_h), (0, xK_Left))]
	--setDefaultKeyRemap emptyKeyRemap [emptyKeyRemap, dvorakProgrammerKeyRemap]
	--setKeyRemap $  emptyKeyRemap ++ KeymapTable [((controlMask, xK_h), (0, xK_Left))]
	--KeymapTable [((controlMask, xK_h), (0, xK_Left))]
	--let keys = KeymapTable [((0, xK_a), (0, xK_t))]
	-- ++ buildKeyRemapBindings [emptyKeyRemap]
	--setKeyRemap $ KeymapTable [((0, xK_a), (shiftMask, xK_t))]
	setKeyRemap $ (KeymapTable [((shiftMask, xK_t), (0, xK_a))])
	-}

main = do
--bar <- spawnPipe "xmobar"
xmonad $ defaultConfig
	{
	terminal = "urxvtc",
	borderWidth = 3,
	focusedBorderColor = "#0000FF",
	normalBorderColor = "#808080",
	modMask = mod1Mask,
	workspaces = map show [1..9],
	startupHook = spawn "urxvtc",
	layoutHook = noBorders Full ||| Tall 1 (1/100) (1/2),
	logHook = ICCCMFocus.takeTopFocus
	--startupHook = tm
	--logHook = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn bar}
	}

	`additionalKeysP`
	[
	("M-q", spawn "xmonad --recompile; xmonad --restart"),
	("M-<F4>", kill),
	("<Print>", spawn "scrot /$HOME/work/screenshot/%Y%m%d-%H%M%S.png"),
	("C-<Print>", spawn "scrot /$HOME/work/screenshot/%Y%m%d-%H%M%S.png -u"),
	("M-<F9>", spawn "xinput --disable Mouse0"),
	("M-S-<F9>", spawn "xinput --enable Mouse0")
	--("M-x", xmonadPrompt defaultXPConfig),
	--("M-b", prompt "urxvt" greenXPConfig)
	]

