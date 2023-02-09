state("Project64", "1.6")
{
    byte level : "Project64.exe", 0xD6A1C, 0x32DDFA;
	byte mainMenu : "Project64.exe", 0xD6A1C, 0x1A7D13;
	uint music : "Project64.exe", 0xD6A1C, 0x22261C;
	byte fileAkey : "Project64.exe", 0xD6A1C, 0x207708;
}

startup
{
    settings.Add("noend", true, "Enable auto-splitting the final screen");
}

start
{
    return
		current.fileAkey == 0 &&
		current.mainMenu == 255 &&
		current.music == 1610612736 &&
		old.music != 1610612736;
}

reset
{
    return
		current.fileAkey == 0 &&
		current.mainMenu == 255 &&
		current.music == 1610612736 &&
		old.music != 1610612736;
}

split
{
	return
		(old.level != 6 && old.level != 31 && old.level != current.level && current.level == 26) ||
		(settings["noend"] && current.level == 25);
}
