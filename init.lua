-- branchpaster v1.1
-- markus behrens 2019

function branchpaster()
	hs.eventtap.keyStroke({"cmd"}, "c")

	content = hs.pasteboard.getContents()
	button, version = hs.dialog.textPrompt("Version:", "", "4.1.0")
	temp = content
	category = "?"

	if string.gmatch(content, "^.*Fehler ") then
		temp = string.gsub(content, "^.*Fehler ", "")
		category = "bug"
	elseif string.gmatch(content, "^.*Aufgabe ") then
		temp = string.gsub(content, "^.*Aufgabe ", "")
		category = "feature"
	elseif string.gmatch(content, "^.*User Story ") then
		temp = string.gsub(content, "^.*User Story ", "")
		category = "feature"
	elseif string.gmatch(content, "^.*Epic ") then
		temp = string.gsub(content, "^.*Epic ", "")
		category = "feature"
	end

	number = string.gsub(temp, ":.*$", "")
	text = string.gsub(temp, number, "")
	text = string.gsub(text, ":iPad: ", "")
	text = string.gsub(text, " ", "-")
	text = string.gsub(text, ":", "-")
	text = string.gsub(text, "%-%-", "-")
	text = string.gsub(text, "ä", "ae")
	text = string.gsub(text, "ö", "oe")
	text = string.gsub(text, "ü", "ue")
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
