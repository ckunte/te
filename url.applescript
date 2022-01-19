-- Gets url and title of the front browser window. Assign a trigger to this
-- script in TextExpander reference style markdown link (and title in quotes)
-- credits: @bachya ( https://gist.github.com/bachya/694ff8a774f805882218 )

tell application "System Events"
	set numSafari to count (every process whose name is "Safari")
	set numOpera to count (every process whose name is "Opera")
end tell

if numSafari > 0 then
	tell application "Safari"
		set fURL to URL of front document
		set fTitle to name of front document
	end tell
else
	if numOpera > 0 then
		tell application "Opera"
			set frontIndex to active tab index of front window
			
			set fURL to URL of tab frontIndex of front window
			set fTitle to title of tab frontIndex of front window
		end tell
	end if
end if

get fURL & " \"" & fTitle & "\""