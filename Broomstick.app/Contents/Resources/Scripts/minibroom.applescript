on run
	try
		## Set Action
		set ActionType to (choose from list {"Hide an App", "Show an App", "Customise Order of Menubar Icons", "Check for Updates", "Submit App Request", "Quit"} with prompt "What would you like to do?" with title "Broomstick") as text
		if (ActionType is "Hide an App" or ActionType is "Show an App") then
			
			## Conjugate Action
			if ActionType is "Hide an App" then
				set ActionType to "hide"
			else if ActionType is "Show an App" then
				set ActionType to "show"
			end if
			
			## List Installed Apps
			## BEGIN MODS
			try
				set ExtConfigs to paragraphs of (do shell script "ls -1 '" & ((POSIX path of (path to application support from user domain)) & "Broomstick/'") as text)
			on error
				set ExtConfigs to {}
			end try
			## END MODS
			
			try
				## BEGIN MODS
				set HideableAppList to {"Adium", "Air Video Server", "Alfred", "Apple's Icons (Wifi, Battery, etc…)", "Avira", "BetterTouchTool", "Boom", "Breeze", "Caffeine", "Chronicle Mini", "ChronoSync", "Click.to", "Cloud", "CPU Speed Accelerator", "CrashPlan", "Dimmer", "Dropbox", "DropCopy", "Droplr", "Evernote", "Flutter", "Flux", "FullControlHelper", "Garmin ANT Agent", "GrabBox", "GrabBox2", "Growl", "GrowlTunes", "Hiss", "Insync", "iTeleport Connect", "JDownloader", "Kuvva", "Last.fm", "LogMeIn", "LogMeIn Hamachi", "Memeo Backup", "MiddleClick", "MuteCon", "Nocturne", "Notification Center", "NoSleepHelper", "OpenDNS Updater", "PleaseSleep", "PuntoSwitcher", "Quiet Read", "RemotelessHelper", "Seamless", "SnagIt", "Splashtop Streamer", "Spotlight", "ToDoHelper", "Wakoopa Tracker", "Wallpaper Clocks", "Xmarks for Safari"} & ExtConfigs
				## END MODS
				set InstalledHideableAppList to {}
				set InstalledAppListPaths to (do shell script "mdfind 'kMDItemContentTypeTree == com.apple.application'")
				if InstalledAppListPaths is "" then set InstalledAppList to HideableAppList
				set InstalledAppList to {}
				repeat with i from 1 to number of paragraphs in InstalledAppListPaths
					set AppleScript's text item delimiters to "/"
					set DelimitedPathNames to characters 1 thru -5 of text item -1 of paragraph i of InstalledAppListPaths
					set AppleScript's text item delimiters to ""
					set InstalledAppList to InstalledAppList & (DelimitedPathNames as text)
				end repeat
				## Compare Installed to Hideable Apps
				repeat with i from 1 to number of items in HideableAppList
					set this_item to item i of HideableAppList
					if (InstalledAppList & "Notification Center" & "Spotlight" & "Apple's Icons (Wifi, Battery, etc…)") contains this_item then set InstalledHideableAppList to InstalledHideableAppList & this_item
				end repeat
				set InstalledHideableAppList to InstalledHideableAppList & "	Application not listed?"
			on error
				set InstalledHideableAppList to HideableAppList & "Notificaltion Center" & "Spotlight" & "Apple's Icons (Wifi, Battery, etc…)" & "	Application not listed?"
			end try
			
			## Set Application
			set AppName to ((choose from list InstalledHideableAppList with prompt "Choose an application to " & ActionType & ":" with title "Broomstick") as text)
			
			## Log AppName for Stats
			try
				try
					set OldList to do shell script "defaults read com.zibity.broomstick recentapps"
				on error
					set OldList to ""
				end try
				if AppName is not "	Application not listed?" then do shell script "defaults write com.zibity.broomstick recentapps " & quoted form of (OldList & ", " & AppName)
			end try
			
			## Wave the Wand
			if AppName is "Adium" then
				StinkyPoo("Adium", "open Adium's preferences, select the \"General\" tab, and uncheck the \"Show Adium status in menubar\" option.")
			else if AppName is "Air Video Server" then
				Wand("Air Video Server", ActionType, {"mac-menu-off-selected.png", "mac-menu-off.png", "mac-menu-on-selected.png", "mac-menu-on.png"}, true)
			else if AppName is "Alfred" then
				StinkyPoo("Alfred", "open Alfred's preferences, then click on the Appearance tab, then the Options tab, then select \"Hide menubar icon\".")
			else if AppName is "Avira" then
				Wand("Avira", ActionType, {"controlcenter/images/trayicons/menubar_icon_closed.png", "controlcenter/images/trayicons/menubar_icon_open.png"}, false)
				try
					do shell script "killall AV_Systray"
				end try
			else if AppName is "BetterTouchTool" then
				StinkyPoo("BetterTouchTool", "launch BetterTouchTool from the Finder, then toggle Advanced mode (in the toolbar), then open the \"General Settings\" tab, then deselect \"Show Menubar Icon\".")
			else if AppName is "Breeze" then
				Wand("Breeze", ActionType, {"breezeIconAlt.png", "breezeIconNormal.png"}, true)
			else if AppName is "Boom" then
				Wand("Boom", ActionType, {"0_clicked.png", "0.png", "1-20_clicked.png", "1-20.png", "20-40_clicked.png", "20-40.png", "40-60_clicked.png", "40-60.png", "60-80_clicked.png", "60-80.png"}, true)
			else if AppName is "Caffeine" then
				Wand("Caffeine", ActionType, {"active.png", "inactive.png", "highlighted.png", "highlightactive.png"}, true)
			else if AppName is "Chronicle Mini" then
				Wand("Chronicle Mini", ActionType, {"calcbw.png", "calcw.png", "MiniIcon.png"}, true)
			else if AppName is "ChronoSync" then
				Wand("ChronoSyncBackgrounder", ActionType, {"CSErrorStatusBar_S.tiff", "CSErrorStatusBar_SH.tiff", "CSErrorStatusBar.tiff", "CSErrorStatusBarH.tiff", "CSStatusBar_S.tiff", "CSStatusBar_SH.tiff", "CSStatusBar.tiff", "CSStatusBarH.tiff"}, true)
			else if AppName is "Click.to" then
				Wand("Click.to", ActionType, {"Icon16_bw.png", "Icon16.png"}, true)
			else if AppName is "Cloud" then
				Wand("Cloud", ActionType, {"StatusItem-Error.png", "StatusItem-Gradient.png", "StatusItem-Inactive.png", "StatusItem-Mask.png", "StatusItem-Progress.png", "StatusItem-Selected.png", "StatusItem-Success.png", "StatusItem-Working1.png", "StatusItem-Working2.png", "StatusItem-Working3.png", "StatusItem.png"}, true)
			else if AppName is "CPU Speed Accelerator" then
				Wand("CPU Speed Accelerator", ActionType, {"IconPicture.pict"}, true)
			else if AppName is "CrashPlan" then
				Wand("CrashPlan", ActionType, {"CrashPlan menu bar.app/Contents/Resources/play.png", "CrashPlan menu bar.app/Contents/Resources/play_gray.png", "CrashPlan menu bar.app/Contents/Resources/pause.png", "CrashPlan menu bar.app/Contents/Resources/pause_gray.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_play.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_play_gray.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_pause.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_pause_gray.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_invisible.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_info.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_info_small.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_warning_alert.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_severe_alert.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_safe_alert.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_paused.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_gray.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_complete_alert.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_status_active_anim0.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_cp_icon_clicked.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_computer_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_computer_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_computer_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_computer_status_offline.png", "CrashPlan menu bar.app/Contents/Resources/no_animation_computer_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/invisible.png", "CrashPlan menu bar.app/Contents/Resources/info.png", "CrashPlan menu bar.app/Contents/Resources/info_small.png", "CrashPlan menu bar.app/Contents/Resources/gradient_play.png", "CrashPlan menu bar.app/Contents/Resources/gradient_play_gray.png", "CrashPlan menu bar.app/Contents/Resources/gradient_pause.png", "CrashPlan menu bar.app/Contents/Resources/gradient_pause_gray.png", "CrashPlan menu bar.app/Contents/Resources/gradient_invisible.png", "CrashPlan menu bar.app/Contents/Resources/gradient_info.png", "CrashPlan menu bar.app/Contents/Resources/gradient_info_small.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_warning_alert.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_severe_alert.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_safe_alert.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_paused.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_gray.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_complete_alert.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim26.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim25.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim24.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim23.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim22.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim21.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim20.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim19.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim18.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim17.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim16.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim15.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim14.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim13.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim12.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim11.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim10.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim9.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim8.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim7.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim6.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim5.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim4.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim3.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim2.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim1.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_status_active_anim0.png", "CrashPlan menu bar.app/Contents/Resources/gradient_cp_icon_clicked.png", "CrashPlan menu bar.app/Contents/Resources/gradient_computer_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/gradient_computer_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/gradient_computer_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/gradient_computer_status_offline.png", "CrashPlan menu bar.app/Contents/Resources/gradient_computer_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/dots_play.png", "CrashPlan menu bar.app/Contents/Resources/dots_play_gray.png", "CrashPlan menu bar.app/Contents/Resources/dots_pause.png", "CrashPlan menu bar.app/Contents/Resources/dots_pause_gray.png", "CrashPlan menu bar.app/Contents/Resources/dots_invisible.png", "CrashPlan menu bar.app/Contents/Resources/dots_info.png", "CrashPlan menu bar.app/Contents/Resources/dots_info_small.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_warning_alert.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_severe_alert.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_safe_alert.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_paused.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_gray.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_complete_alert.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim21.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim20.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim19.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim18.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim17.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim16.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim15.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim14.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim13.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim12.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim11.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim10.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim9.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim8.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim7.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim6.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim5.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim4.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim3.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim2.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim1.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_status_active_anim0.png", "CrashPlan menu bar.app/Contents/Resources/dots_cp_icon_clicked.png", "CrashPlan menu bar.app/Contents/Resources/dots_computer_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/dots_computer_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/dots_computer_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/dots_computer_status_offline.png", "CrashPlan menu bar.app/Contents/Resources/dots_computer_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/crashplan_status.icns
cp_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_warning_alert.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_severe_alert.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_safe_dots.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_safe_alert.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_paused.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_paused_dots.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_gray.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_complete_dots.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_complete_alert.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_alert_dots.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots21.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots20.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots19.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots18.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots17.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots16.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots15.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots14.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots13.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots12.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots11.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots10.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots9.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots8.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots7.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots6.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots5.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots4.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots3.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots2.png", "CrashPlan menu bar.app/Contents/Resources/cp_status_active_anim_dots1.png", "CrashPlan menu bar.app/Contents/Resources/cp_icon_clicked.png", "CrashPlan menu bar.app/Contents/Resources/computer_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/computer_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/computer_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/computer_status_offline.png", "CrashPlan menu bar.app/Contents/Resources/computer_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/colors_play.png", "CrashPlan menu bar.app/Contents/Resources/colors_play_gray.png", "CrashPlan menu bar.app/Contents/Resources/colors_pause.png", "CrashPlan menu bar.app/Contents/Resources/colors_pause_gray.png", "CrashPlan menu bar.app/Contents/Resources/colors_invisible.png", "CrashPlan menu bar.app/Contents/Resources/colors_info.png", "CrashPlan menu bar.app/Contents/Resources/colors_info_small.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_warning_alert.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_severe_alert.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_safe_alert.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_paused.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_gray.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_complete.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_complete_alert.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim26.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim25.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim24.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim23.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim22.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim21.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim20.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim19.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim18.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim17.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim16.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim15.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim14.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim13.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim12.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim11.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim10.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim9.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim8.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim7.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim6.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim5.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim4.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim3.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim2.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim1.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_status_active_anim0.png", "CrashPlan menu bar.app/Contents/Resources/colors_cp_icon_clicked.png", "CrashPlan menu bar.app/Contents/Resources/colors_computer_status_warning.png", "CrashPlan menu bar.app/Contents/Resources/colors_computer_status_severe.png", "CrashPlan menu bar.app/Contents/Resources/colors_computer_status_safe.png", "CrashPlan menu bar.app/Contents/Resources/colors_computer_status_offline.png", "CrashPlan menu bar.app/Contents/Resources/colors_computer_status_complete.png"}, false)
				## Relaunch App
				try
					tell application "CrashPlan menu bar.app" to quit
					delay 2
					tell application "CrashPlan menu bar.app" to activate
				end try
			else if AppName is "Dimmer" then
				Wand("Dimmer", ActionType, {"icon-alt.png", "icon.png"}, true)
			else if AppName is "DropCopy" then
				Wand("DropCopy", ActionType, {"dropcopy_tiny_menuitem_0.png", "dropcopy_tiny_menuitem_1.png", "dropcopy_tiny_menuitem_2.png", "dropcopy_tiny_menuitem_3.png", "dropcopy_tiny_menuitem_4.png", "dropcopy_tiny_menuitem_5.png", "dropcopy_tiny_menuitem_6.png", "dropcopy_tiny_menuitem_7.png", "dropcopy_tiny_menuitem_alert.png", "dropcopy_tiny_menuitem_dark.png", "dropcopy_tiny_menuitem_light.png"}, true)
			else if AppName is "Dropbox" then
				Wand("Dropbox", ActionType, {"dropboxstatus-busy-lep-inv.tiff", "dropboxstatus-busy-lep.tiff", "dropboxstatus-busy.tiff", "dropboxstatus-busy2-lep-inv.tiff", "dropboxstatus-busy2-lep.tiff", "dropboxstatus-busy2.tiff", "dropboxstatus-busy3-lep-inv.tiff", "dropboxstatus-busy3-lep.tiff", "dropboxstatus-busy3.tiff", "dropboxstatus-busy4-lep-inv.tiff", "dropboxstatus-busy4-lep.tiff", "dropboxstatus-busy4.tiff", "dropboxstatus-cam-lep-inv.tiff", "dropboxstatus-cam-lep.tiff", "dropboxstatus-cam.tiff", "dropboxstatus-cam2-lep-inv.tiff", "dropboxstatus-cam2-lep.tiff", "dropboxstatus-cam2.tiff", "dropboxstatus-cam3-lep-inv.tiff", "dropboxstatus-cam3-lep.tiff", "dropboxstatus-cam3.tiff", "dropboxstatus-cam4-lep-inv.tiff", "dropboxstatus-cam4-lep.tiff", "dropboxstatus-cam4.tiff", "dropboxstatus-idle-lep-inv.tiff", "dropboxstatus-idle-lep.tiff", "dropboxstatus-idle.tiff", "dropboxstatus-logo-lep-inv.tiff", "dropboxstatus-logo-lep.tiff", "dropboxstatus-logo.tiff", "dropboxstatus-pause-lep-inv.tiff", "dropboxstatus-pause-lep.tiff", "dropboxstatus-pause.tiff", "dropboxstatus-x-lep-inv.tiff", "dropboxstatus-x-lep.tiff", "dropboxstatus-x.tiff"}, true)
			else if AppName is "Droplr" then
				Wand("Droplr", ActionType, {"1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "10.png", "11.png", "12.png", "13.png", "14.png", "15.png", "16.png", "17.png", "18.png", "19.png", "20.png", "21.png", "22.png", "23.png", "24.png", "25.png", "26.png", "27.png", "28.png", "29.png", "30.png", "31.png", "32.png", "33.png", "34.png", "35.png", "36.png", "37.png", "38.png", "39.png", "40.png", "41.png", "42.png", "43.png", "44.png", "45.png", "46.png", "47.png", "48.png", "49.png", "50.png", "51.png", "52.png", "53.png", "54.png", "55.png", "56.png", "57.png", "DMStatusItemIcon.pdf", "DMStatusItemIcon.png", "DMStatusItemIconDisabled.png", "DMStatusItemIconError.png", "DMStatusItemIconHighlighted.png"}, true)
			else if AppName is "Evernote" then
				set {AppName, IconList} to {"Evernote", {"extrasicon_pressed.png", "extrasicon_recording_pressed.png", "extrasicon_recording.png", "extrasicon.png"}}
				## Get AppPath
				set AppPath to (POSIX path of (path to application AppName)) as text
				
				## Formulate IconRoot
				set IconRoot to AppPath & "Contents/Library/LoginItems/EvernoteHelper.app/Contents/Resources/"
				
				## Set ChmodNum
				if ActionType is "hide" then
					set ChmodNum to "000"
				else
					set ChmodNum to "755"
				end if
				
				## Modify Icon Permissions
				repeat with i from 1 to number of items in IconList
					set ThisIcon to item i of IconList
					try
						do shell script "sudo chmod " & ChmodNum & " " & quoted form of (IconRoot & ThisIcon) with administrator privileges
					end try
				end repeat
				
				## Relaunch App
				try
					do shell script "killall " & quoted form of "EvernoteHelper"
				end try
				delay 2
				try
					tell application (AppPath & "Contents/Library/LoginItems/EvernoteHelper.app") as text to activate
				end try
				
				## Alert of Result
				tell me to activate
				if ActionType is "hide" then set ActionType to "hidde"
				display alert "Broomstick Success" message AppName & "'s icon has been successfully " & ActionType & "n by Broomstick."
			else if AppName is "Flutter" then
				Wand("Flutter", ActionType, {"Flutter.icns", "Flutter.png", "FlutterGray.png"}, true)
			else if AppName is "Flux" then
				Wand("Flux", ActionType, {"flux-icon-mono-inv.png", "flux-icon-mono-inv@2x.png", "flux-icon-mono4.png", "flux-icon-mono4@2x.png"}, true)
			else if AppName is "FullControlHelper" then
				Wand("FullControlHelper", ActionType, {"FullControlHelper_statusBar.png"}, true)
			else if AppName is "Garmin ANT Agent" then
				Wand("Garmin ANT Agent", ActionType, {"ANT_mactoolbar_alternate.png", "ANT_mactoolbar_inactive_1.png", "ANT_mactoolbar_message.png", "ANT_mactoolbar_nrml.png", "ANT_mactoolbar_pending.png", "ANT_mactoolbar_transferbar0.png", "ANT_mactoolbar_transferbar1.png", "ANT_mactoolbar_transferbar2.png"}, true)
			else if AppName is "Google Drive" then
				Wand("Google Drive", ActionType, {"mac-animate1.png", "mac-animate2.png", "mac-animate3.png", "mac-animate4.png", "mac-animate5.png", "mac-animate6.png", "mac-animate7.png", "mac-animate8.png", "mac-error.png", "mac-inactive.png", "mac-normal.png", "mac-paused.png"}, true)
			else if AppName is "GrabBox" then
				Wand("GrabBox", ActionType, {"menuicon.png", "menuiconInverted.png"}, true)
			else if AppName is "GrabBox2" then
				Wand("GrabBox2", ActionType, {"menuicon.png", "menuiconInverted.png"}, true)
			else if AppName is "Growl" then
				StinkyPoo("Growl", "launch Growl from the Finder, then in the General tab, select \"No icon visible\".")
			else if AppName is "GrowlTunes" then
				Wand("GrowlTunes", ActionType, {"growlTunes-selected.png", "growlTunes.png"}, true)
			else if AppName is "Hiss" then
				Wand("Hiss", ActionType, {"status-icon.png"}, true)
			else if AppName is "Insync" then
				Wand("Insync", ActionType, {"plain-error.png", "plain-highlighted.png", "plain-idle.png", "plain-partial-error.png", "plain-synced.png", "plain-syncing-1.png", "plain-syncing-2.png", "plain-syncing-3.png", "plain-syncing-4.png", "update-error-1.png", "update-error-2.png", "update-error-3.png", "update-error-4.png", "update-error-5.png", "update-error-6.png", "update-error-7.png", "update-error-8.png", "update-error-9.png", "update-error-10.png", "update-partial-error-1.png", "update-partial-error-2.png", "update-partial-error-3.png", "update-partial-error-4.png", "update-partial-error-5.png", "update-partial-error-6.png", "update-partial-error-7.png", "update-partial-error-8.png", "update-partial-error-9.png", "update-partial-error-10.png", "update-synced-1.png", "update-synced-2.png", "update-synced-3.png", "update-synced-4.png", "update-synced-5.png", "update-synced-6.png", "update-synced-7.png", "update-synced-8.png", "update-synced-9.png", "update-synced-10.png", "update-syncing-1.png", "update-syncing-2.png", "update-syncing-3.png", "update-syncing-4.png"}, true)
			else if AppName is "iTeleport Connect" then
				Wand("iTeleport Connect", ActionType, {"status-blank.png", "status-normal.png", "status-red.png"}, true)
			else if AppName is "JDownloader" then
				Wand("JDownloader", ActionType, {"app/jd/img/logo/jd_logo_128_128.png"}, true)
			else if AppName is "Kuvva" then
				Wand("Kuvva", ActionType, {"StatusIcon-Disabled.png", "StatusIcon-Neutral.png", "StatusIcon-Progress-0.png", "StatusIcon-Progress-1.png", "StatusIcon-Progress-2.png", "StatusIcon-Progress-3.png", "StatusIcon-Progress-4.png", "StatusIcon-Selected.png"}, true)
			else if AppName is "Last.fm" then
				StinkyPoo("Last.fm", "right click on Last.fm's icon in your menubar, select \"Preferences\", then uncheck the \"show application in menubar\" option.")
			else if AppName is "LogMeIn" then
				Wand("LogMeinGUI", ActionType, {"lmi_mac_offline.png", "lmi_mac_online.png"}, true)
			else if AppName is "LogMeIn Hamachi" then
				Wand("LogMeIn Hamachi Menubar", ActionType, {"status_offline_message.png", "status_offline.png", "status_online_message.png", "status_online.png", "status_reconnecting.png"}, true)
			else if AppName is "Memeo Backup" then
				Wand("MemeoAgent", ActionType, {"lifeagent16x16.png"}, true)
			else if AppName is "MiddleClick" then
				Wand("MiddleClick", ActionType, {"mouse.png"}, true)
			else if AppName is "MuteCon" then
				Wand("MuteCon", ActionType, {"mutecon-alt.png", "mutecon.png"}, true)
			else if AppName is "Nocturne" then
				Wand("Nocturne", ActionType, {"NocturneMenu.png", "NocturneMenuPressed.png"}, true)
			else if AppName is "Notification Center" then
				## Set ChmodNum
				if ActionType is "hide" then
					set ChmodNum to "000"
				else
					set ChmodNum to "755"
				end if
				
				set IconList to {"menuitemMute.tiff", "menuitemNormal.tiff", "menuitemPressed.tiff"}
				## Modify Icon Permissions
				repeat with i from 1 to number of items in IconList
					set ThisIcon to item i of IconList
					try
						do shell script "sudo chmod " & ChmodNum & " " & quoted form of ("/System/Library/CoreServices/NotificationCenter.app/Contents/Resources/" & ThisIcon) with administrator privileges
					end try
				end repeat
				
				try
					tell application "System Events" to do shell script "kill " & unix id of process "Notification Center"
				end try
				## Alert of Result
				tell me to activate
				if ActionType is "hide" then set ActionType to "hidde"
				display alert "Broomstick Success" message "Notification Center's icon has been successfully " & ActionType & "n by Broomstick."
			else if AppName is "NoSleepHelper" then
				Wand("NoSleepHelper", ActionType, {"ZzTemplate.png"}, true)
			else if AppName is "OpenDNS Updater" then
				Wand("OpenDNS Updater", ActionType, {"menuicon.tif"}, true)
			else if AppName is "PleaseSleep" then
				Wand("PleaseSleep", ActionType, {"menu-black-hilite.gif", "menu-black-off.gif", "menu-black-on.gif", "menu-green-hilite.gif", "menu-green-off.gif", "menu-green-on.gif", "menu-hilite.gif", "menu-off.gif", "menu-on.gif", "menu-purple-hilite.gif", "menu-purple-off.gif", "menu-purple-on.gif"}, true)
			else if AppName is "PuntoSwitcher" then
				Wand("PuntoSwitcher", ActionType, {"menubar_icons/icon_active_w.png", "menubar_icons/icon_active.png", "menubar_icons/icon_disabled_w.png", "menubar_icons/icon_disabled.png", "menubar_icons/icon_inactive_w.png", "menubar_icons/icon_inactive.png", "menubar_icons/mac_select_on.png", "menubar_icons/select_on_disabled.png"}, true)
			else if AppName is "Quiet Read" then
				Wand("Quiet Read", ActionType, {"cup.png"}, true)
			else if AppName is "RemotelessHelper" then
				Wand("RemotelessHelper", ActionType, {"MenuIcon.png"}, true)
			else if AppName is "Spotlight" then
				if ActionType is "hide" then
					set ChmodNum to "000"
				else
					set ChmodNum to "755"
				end if
				do shell script "sudo chmod " & ChmodNum & " /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search" with administrator privileges
				do shell script "killall SystemUIServer"
				## Alert of Result
				tell me to activate
				if ActionType is "hide" then set ActionType to "hidde"
				display alert "Broomstick Success" message "Spotlight's icon has been successfully " & ActionType & "n by Broomstick."
			else if AppName is "Seamless" then
				Wand("Seamless", ActionType, {"SeamlessMacMenuBarIcon-Highlighted.png", "SeamlessMacMenuBarIcon.png"}, true)
			else if AppName is "SnagIt" then
				Wand("SnagIt", ActionType, {"SnagitMenuIcon_Recording.png", "SnagitMenuIcon.png"}, true)
			else if AppName is "Splashtop Streamer" then
				Wand("Splashtop Streamer", ActionType, {"16x16_normal_black.png", "16x16_normal_gray.png", "Connected.png", "DisableConnect.png"}, true)
			else if AppName is "ToDoHelper" then
				Wand("ToDoHelper", ActionType, {"menu-conflict.png", "menu-conflict2.png", "menu-done.png", "menu-error.png", "menu-error2.png", "menu-green.png", "menu-normal-t.png", "menu-normal.png", "menu-not-connected.png", "not-connected-t.png", "not-connected.png", "not-paired-t.png", "not-paired.png", "syncing0001-t.png", "syncing0001.png", "syncing0002-t.png", "syncing0002.png", "syncing0003-t.png", "syncing0003.png", "syncing0004-t.png", "syncing0004.png", "syncing0005-t.png", "syncing0005.png", "syncing0006-t.png", "syncing0006.png", "syncing0007-t.png", "syncing0007.png", "syncing0008-t.png", "syncing0008.png", "syncing0009-t.png", "syncing0009.png", "syncing0010-t.png", "syncing0010.png", "syncing0011-t.png", "syncing0011.png", "syncing0012-t.png", "syncing0012.png"}, true)
			else if AppName is "Wakoopa Tracker" then
				Wand("Wakoopa Tracker", ActionType, {"icon_alert_mac_menu.png", "icon_alert_mac_menubar_onclick.png", "icon_alert_mac_menubar.png", "icon_error_mac_menu.png", "icon_error_mac_menubar_onclick.png", "icon_error_mac_menubar.png", "icon_mac_menubar_onclick.png", "icon_mac_menubar.png", "icon_onclick_mac_menubar.png", "icon_paused_mac_menubar_onclick.png", "icon_paused_mac_menubar.png"}, true)
			else if AppName is "Wallpaper Clocks" then
				Wand("Wallpaper Clocks", ActionType, {"grey22x22.png"}, true)
				## BEGIN MODS;
			else if ExtConfigs contains AppName then
				Wand(AppName, ActionType, paragraphs of (read ((POSIX path of (path to application support from user domain)) & "Broomstick/" & AppName) as text), true)
				## END MODS;
			else if AppName is "Xmarks for Safari" then
				StinkyPoo("Xmarks for Safari", "open Xmarks for Safari's preferences, select the \"Advanced\" tab, and uncheck the \"Display Xmarks' status in the menubar\" option.")
			else if AppName is "Apple's Icons (Wifi, Battery, etc…)" then
				display alert "How to hide Apple's Icons" message "Broomstick cannot hide Apple's icons, but it's very easy for you to do it!

Just hold the Command key (⌘) and drag the icon out of your menubar."
			else if AppName is "	Application not listed?" then
				Request()
			end if
		else if ActionType is "Customise Order of Menubar Icons" then
			## Explain this tool
			display alert "Customise Order of Menubar Icons" message "Broomstick can be used to control the order in which the icons in your menubar appear. This can be useful to ensure that the transparent space left behind by hidden icons doesn't disrupt the appearance of the menubar." buttons {"Cancel", "Continue"} cancel button 1 default button 2
			
			## Read Old App Order list
			try
				set AppOrderList to do shell script "defaults read com.zibity.broomstick apporder"
			on error
				set AppOrderList to ""
			end try
			set AppleScript's text item delimiters to "|"
			set AppOrderList to text items of AppOrderList
			set AppleScript's text item delimiters to "
"
			set AppOrderList to (text items of AppOrderList) as text
			set AppleScript's text item delimiters to ""
			
			
			set {ButtonReturned, DialogText} to {"", AppOrderList}
			repeat until ButtonReturned is "Done"
				## Show dialog
				set {TextReturned, ButtonReturned} to {text returned, button returned} of (display dialog "Enter the names of your menubar apps in the order in which you'd like their icons to appear in your menubar:

" & DialogText default answer "" buttons {"Done", "Clear List", "Add App"} default button 3 with title "Broomstick" with icon 1)
				if ButtonReturned is "Done" then exit repeat
				if ButtonReturned is "Clear List" then set DialogText to ""
				
				if TextReturned is not "" then
					set AppleScript's text item delimiters to " "
					set ThisApplication to application TextReturned
					set AppleScript's text item delimiters to "
"
					set DialogText to (paragraphs of DialogText & name of ThisApplication) as text
					set AppleScript's text item delimiters to ""
				end if
			end repeat
			set AppOrderListUnpurified to DialogText
			
			## Clean for writeout
			set AppleScript's text item delimiters to {"
", "
"}
			set AppOrderListUnpurified to (text items of AppOrderListUnpurified)
			set NewAppOrder to {}
			repeat with i from 1 to number of items in AppOrderListUnpurified
				set this_item to item i of AppOrderListUnpurified
				if this_item is not "" then set NewAppOrder to NewAppOrder & this_item
			end repeat
			set AppleScript's text item delimiters to {"|"}
			do shell script "defaults write com.zibity.broomstick apporder " & quoted form of ((text items of NewAppOrder) as text)
			set AppleScript's text item delimiters to ""
			
			display alert "Your menubar icons are about to be ordered, as you requested. This may take up to a minute, depending on how many menubar apps you have." buttons {"Cancel", "Order My Icons"} cancel button 1 default button 2
			
			## Summon Broomstick Menubar Icon Orderer.app
			try
				do shell script "open -a " & quoted form of (do shell script "defaults read com.zibity.broomstick BMIO")
			end try
			display dialog "Broomstick is now reordering your menubar icons." giving up after 3 with icon 1 with title "Broomstick" buttons {"OK"} default button 1
			
		else if ActionType is "Check for Updates" then
			display alert "Check for Updates?" message "Broomstick automatically checks for updates every time it is launched and more than 24 hours have passed since it last checked for updates. 

You can force Broomstick to check for updates now by selecting the button below." buttons {"Cancel", "Check for Updates"} default button 2 cancel button 1
			if (run script POSIX file (do shell script "defaults read com.zibity.broomstick NinjaUpdaterLocation") with parameters {"Broomstick", "broomstick", true}) is "No update available" then display alert "No Update Needed" message "You are already running the latest version of Broomstick."
		else if ActionType is "Submit App Request" then
			Request()
		else if (ActionType is "Quit" or ActionType is "false") then
			return
		end if
		
		## Begin Again
		run
	on error ErrorMessage number errornumber
		if errornumber is -128 then
			run
		else
			display alert "Error " & errornumber message ErrorMessage
		end if
	end try
end run

## Request Handler
on Request()
	## Get RequestAppName
	set RequestAppName to ""
	repeat until RequestAppName is not ""
		set RequestAppName to text returned of (display dialog "Broomstick lets you hide many different apps, but for obvious reasons, we don't have every single app listed.

If there's another app that you'd like to be able to show/hide, then enter the app's name:" default answer "" with title "Want to hide another app?" buttons {"Cancel", "Continue"} default button 2 cancel button 1)
	end repeat
	
	## Get RequestEmail
	set RequestEmail to text returned of (display dialog "Please enter your email address so that you can be contacted if we need more information, and to notify you when the  app you have requested has been included in Broomstick:" default answer "" with title "Want to hide another app?" buttons {"Cancel", "Submit Request"} default button 2 cancel button 1)
	
	## Send Request
	set RequestSent to false
	repeat until RequestSent is true
		try
			do shell script "curl 'https://spreadsheets.google.com/formResponse?formkey=dEtjY3FsT09mOVZXYnBsYVJBLW9lVkE6MQ' --data 'entry.0.single=" & RequestAppName & "&entry.1.single=" & RequestEmail & "'"
			set RequestSent to true
			set CrowdSourcingYN to button returned of (display alert "Request Submission Success" message "Your request for the application " & quoted form of RequestAppName & " has been sumbitted. Your request will be reviewed, and hopefully soon you will be able to hide " & RequestAppName & "'s icon!

Did you know that you can help speed up the inclusion of your app through crowdsourcing?" buttons {"Return to Main Menu", "Learn more!"})
			if CrowdSourcingYN is "Learn more!" then open location "http://www.zibity.com/broomstick/crowd"
		on error
			set RequestSubmissionFailureRetry to button returned of (display alert "Request Submission Failure" message "Your request for the application " & quoted form of RequestAppName & " could not be submitted. Please try again later." buttons {"Cancel", "Retry Submission"})
			if RequestSubmissionFailureRetry is "Retry Submission" then
				set RequestSent to false
			else
				set RequestSent to true
			end if
		end try
	end repeat
end Request

## Hide/Show Handler
on Wand(AppName, ActionType, IconList, relaunch)
	## Get AppPath
	set AppPath to (POSIX path of (path to application AppName)) as text
	
	## Formulate IconRoot
	set IconRoot to AppPath & "Contents/Resources/"
	
	## Set ChmodNum
	if ActionType is "hide" then
		set ChmodNum to "000"
	else
		set ChmodNum to "755"
	end if
	
	## Modify Icon Permissions
	repeat with i from 1 to number of items in IconList
		set ThisIcon to item i of IconList
		try
			do shell script "sudo chmod " & ChmodNum & " " & quoted form of (IconRoot & ThisIcon) with administrator privileges
		end try
	end repeat
	
	if relaunch is true then
		## Relaunch App
		try
			tell application AppName to quit
		on error
			try
				do shell script "killall " & quoted form of AppName
			end try
		end try
		delay 2
		try
			tell application AppName to activate
		end try
	end if
	
	## Alert of Result
	tell me to activate
	if ActionType is "hide" then set ActionType to "hidde"
	display alert "Broomstick Success" message AppName & "'s icon has been successfully " & ActionType & "n by Broomstick."
end Wand

on StinkyPoo(AppName, Method)
	display alert "Broomstick Can't Hide " & AppName message "Broomstick can't hide " & AppName & " because it already has a way to hide itself!

To hide " & AppName & ", " & Method
end StinkyPoo