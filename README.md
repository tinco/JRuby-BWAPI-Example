## BwapiRuby

This project allows you to use JRuby to control a Starcraft: Broodwar AI.

# Getting Started

I will be using Windows Server 2012 on Azure to go through this guide. If you're on
a different OS some steps might be slightly different.

1. Install Starcraft: Broodwar

You can buy it in the Battle.Net online shop. Unfortunately the default browser on Azure
is so horribly configured that the shop won't work, so first use it to go to getfirefox.com 
and download and install Firefox.

Then go to battle.net and follow their instructions. The game is under "Blizzard Classics"

Take not of the location of the game key, you will need it later.

The downloader will take a while, after which select "Install Starcraft". I recommend installing
Starcraft to `C:\Users\<username>\Starcraft`, this will help skip us some administration privilege
steps later.

2. Install the 1.16.1 patch

You can download it here: 

http://ftp.blizzard.com/pub/broodwar/patches/PC/BW-1161.exe

3. Download and install 32-Bit Java SDK 8

You can download it here:

http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

Note that you have to select the "I agree to the terms" radiobutton above the download list before
you can click download. Make sure you pick the `x86` option *not* the `x64` option. We
need it to be 32-bit to cooperate nicely with Starcraft and BWAPI.

After installing it you will have to set your environment variables. Hit the windows key
and type "environment" hit the down arrow key once to go to settings, and select one of
the search results to go to the "Environment Variables" tool.

Under "System variables" click "new". Set the name to "JAVA_HOME" and the value to "C:\Program Files (x86)\Java\jdk1.8.0_74" or wherever you installed the JDK. Then select the "PATH" variable, click "edit"
and add at the end ";%JAVA_HOME%\bin". Don't forget the semi-colon.

To make sure you did it right, start up a powershell (windows key + "powershell" + enter) and then enter
"java -version" and hit enter. If everything went correctly Java it should say "Java HotSpot(VM) yadayada".

4. Install BWAPI

Download BWAPI from this locations:

https://github.com/bwapi/bwapi/releases/download/v4.1.0-Beta/BWAPI_410B_2_Setup.exe

And install it. Again I suggest installing to `C:\Users\<username>\BWAPI` to avoid administrator privilege
hurdles.

After installation go to the BWAPI directory and in there to the ChaosLauncher directory and make a shortcut to the launcher on your desktop, you'll be using Chaos Launcher to run Starcraft.

While in the Chaos Launcher directory delete the file `BWAPI_PluginInjectord.bwl` (note the 'd' in there).

Then go to the folder you installed Starcraft in, then go to `bwapi-data` and open the `bwapi.ini` file in notepad.
Change the first two configurations to read:

```
ai     = NULL
ai_dbg = NULL
```

Remember where this file is located, you'll want to set more configuration here later.

5. Install VC++ 2013 Runtime

You can get it here:

https://www.microsoft.com/en-us/download/details.aspx?id=40784

Download and install the 32-bit version.

6. Download and install Git

Go here and download and install the client:

https://desktop.github.com/

7. Get and run the project

Now will be a good time to make sure you have a github account. After you got one go to:

https://github.com/tinco/bwapi_ruby_example

Click 'Fork' to fork the repository to your account.

Launch the Github graphical UI and click the plus in the top left corner. Select 'clone' and
then pick the project you just cloned. Leave the window open for the next step.

8. Running the bot

When it's done downloading right click the project name
and select 'Open Git shell'. Now you'll get a nice powershell. Run `.\run.bat`. If you did everything
correctly you'll see the text "Game table mapping not found" printed every few seconds. (Celebrate!)

Now startup Chaos Launcher (it might throw a few errors, disregard those) make sure only the "BWAPI Injector RELEASE" and "W-MODE" plugins are selected, and click "start".

Starcraft will be launched in a small window. Go through the game menus to create a player and launch a custom
game. When in the game you should see `Playing as <player-name> - <race>` in the top left. That means the bot is working!

9. Do your own thing

Read through `bwapi_ruby.rb` to see what classes I've defined for you. Check out the BWMirror documentation to explore the API's available to you:

http://bwmirror.jurenka.sk/

Note that JRuby automatically exposes Ruby style accessors for everything, you'll be able to control Starcraft as
if the API was written in Ruby. Read more about that here:

https://blog.engineyard.com/2009/youve-got-java-in-my-ruby