try
	tell application "Reminders"
		activate
		show list "タスク"
	end tell
	
	delay 0.1
	tell application "System Events" to keystroke "n" using command down
	
on error a number b
	display dialog a
end try