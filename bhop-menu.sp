#define DEBUG

#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>
#include <csgocolors>

#pragma semicolon 1

#define PLUGIN_VERSION "1.0"

public Plugin myinfo = 
{
	name = "bhop menu plugin",
	author = "WidovV",
	description = "A list of bhop features",
	version = PLUGIN_VERSION,
	url = "https://github.com/WidovV"
};

/*
public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	// No need for the old GetGameFolderName setup.
	EngineVersion g_engineversion = GetEngineVersion();
	if (g_engineversion != Engine_CSGO)
	{
		SetFailState("This plugin was made for use with Counter-Strike: Global Offensive only.");
	}
} 
*/

ConVar g_cvPrefix;
ConVar g_cvText;
ConVar g_cvLink;

public void OnPluginStart()
{
	g_cvPrefix = CreateConVar("com_prefix", "{default}[{green}Timer{default}] {green}- {default}", "Plugin prefix" );
	g_cvText = CreateConVar("com_text", "{default}", "Text color");
	g_cvLink = CreateConVar("com_link", "{green}", "Link color");

	RegConsoleCmd("sm_bhop", command_bhop);
	RegConsoleCmd("sm_bhopmenu", command_bhop);
	
	AutoExecConfig(true, "bhop_menu");
}


public Action command_bhop(int client, int args)
{
	Menu menu = new Menu(MenuHandler);
	menu.SetTitle("Bhop Menu\n", "Menu title");
	menu.AddItem("", "Strafetrainer");
	menu.AddItem("", "SSJ");
	menu.AddItem("", "JHUD");
	menu.AddItem("", "FJT");
	menu.AddItem("", "HUD");
	menu.AddItem("", "Line");
	menu.AddItem("", "Map progress");
	menu.AddItem("", "Community");
	menu.AddItem("", "Show triggers");
	menu.AddItem("", "Show clips");
	menu.AddItem("", "Show Keys");
	menu.AddItem("", "Personal Best");
	
	menu.ExitButton = true;
	menu.Display(client, MENU_TIME_FOREVER);
}

public int MenuHandler(Menu menu, MenuAction action, int param1, int param2)
{
	char sText [16];
	char sPrefix [64];
	char sLink [16];

	g_cvText.GetString(sText, sizeof(sText));
	g_cvPrefix.GetString(sPrefix, sizeof(sPrefix));
	g_cvLink.GetString(sLink, sizeof(sLink));

	if (action == MenuAction_Select)
	{
		if(param2 == 0)
		{
			ClientCommand(param1, "sm_strafetrainer");
			CPrintToChat(param1, "%s%sCommand used: %s!strafetrainer", sPrefix, sText, sLink);
		}
		if(param2 == 1)
		{
			ClientCommand(param1, "sm_ssj");
			CPrintToChat(param1, "%s%sCommand used: %s!ssj", sPrefix, sText, sLink);
		}
		if(param2 == 2)
		{
			ClientCommand(param1, "sm_jhud");
			CPrintToChat(param1, "%s%sCommand used: %s!jhud", sPrefix, sText, sLink);
		}
		if(param2 == 3)
		{
			ClientCommand(param1, "sm_fjt");
			CPrintToChat(param1, "%s%sCommand used: %s!ssj", sPrefix, sText, sLink);
		}
		if(param2 == 4)
		{
			ClientCommand(param1, "sm_hudsettings");
			CPrintToChat(param1, "%s%sCommand used: %s!hudsettings", sPrefix, sText, sLink);
		}
		if(param2 == 5)
		{
			ClientCommand(param1, "line");
			CPrintToChat(param1, "%s%sCommand used: %s!line", sPrefix, sText, sLink);
		}
		if(param2 == 6)
		{
			ClientCommand(param1, "progress");
			CPrintToChat(param1, "%s%sCommand used: %s!progress", sPrefix, sText, sLink);
		}
		if(param2 == 7)
		{
			ClientCommand(param1, "sm_community");
			CPrintToChat(param1, "%s%sCommand used: %s!community", sPrefix, sText, sLink);
		}
		if(param2 == 8)
		{
			ClientCommand(param1, "sm_showtriggers");
			CPrintToChat(param1, "%s%sCommand used: %s!showtriggers", sPrefix, sText, sLink);
		}
		if(param2 == 9)
		{
			ClientCommand(param1, "sm_showplayerclips");
			CPrintToChat(param1, "%s%sCommand used: %s!showplayerclips", sPrefix, sText, sLink);
		}
		if(param2 == 10)
		{
			ClientCommand(param1, "sm_skeys");
			CPrintToChat(param1, "%s%sCommand used: %s!skeys", sPrefix, sText, sLink);
		}
		if(param2 == 11)
		{
			ClientCommand(param1, "sm_time");
			CPrintToChat(param1, "%s%sCommand used: %s!time", sPrefix, sText, sLink);
		}
		if (action == MenuAction_End)
		{
		delete menu;
		}
	}
}