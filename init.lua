-- branchpaster v1.2
-- markus behrens 2019

function branchpaster()
	hs.eventtap.keyStroke({"cmd"}, "c")
	hs.focus()

	content = hs.pasteboard.getContents()
	button, version = hs.dialog.textPrompt("Version:", "", "4.2.0")
	temp = content
	category = "?"

	if string.sub(content, 0, 7) == "Fehler " then
		temp = string.sub(content, 8)
		category = "bug"
	elseif string.sub(content, 0, 8) == "Aufgabe " then
		temp = string.sub(content, 9)
		category = "feature"
	elseif string.sub(content, 0, 11) == "User Story " then
		temp = string.sub(content, 12)
		category = "feature"
	elseif string.sub(content, 0, 5) == "Epic " then
		temp = string.sub(content, 6)
		category = "feature"
	end

	number = string.gsub(temp, ":.*$", "")
	text = string.gsub(temp, number .. ":", "")
	text = string.gsub(text, "iPad: ", "")
	text = string.gsub(text, " ", "-")
	text = string.gsub(text, ":", "-")
	text = string.gsub(text, "%-%-", "-")
	text = string.gsub(text, "ä", "ae")
	text = string.gsub(text, "Ä", "Ae")
	text = string.gsub(text, "ö", "oe")
	text = string.gsub(text, "Ö", "Oe")
	text = string.gsub(text, "ü", "ue")
	text = string.gsub(text, "Ü", "Ue")
	text = string.gsub(text, "ß", "ss")
	text = string.gsub(text, "%.", "")
	text = string.gsub(text, "%,", "")
	text = string.gsub(text, "%(", "")
	text = string.gsub(text, "%)", "")
	text = string.gsub(text, "/", "")
	text = string.gsub(text, "\\", "")
	text = string.gsub(text, "'", "")
	text = string.gsub(text, "\"", "")
	text = string.gsub(text, "!", "")
	text = string.gsub(text, "?", "")
	text = string.gsub(text, "§", "")
	text = string.gsub(text, "&", "")
	text = string.gsub(text, "=", "")
	text = string.gsub(text, "+", "")
	text = string.gsub(text, ";", "")

	hs.pasteboard.setContents(category .. "/" .. version .. "/" .. number .. "_" .. text)
end

hs.hotkey.bind({"control"}, "<", branchpaster)
hs.hotkey.bind({"command"}, "<", branchpaster)
