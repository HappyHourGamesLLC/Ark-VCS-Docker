# What is Ark?

Ark is a centralized versioning control system, specially focused on game development, but can be used for any kind of development.

For an extensive list of what it is and how it differs from other versioning control system, please check https://ark-vcs.com.

Thank you for taking the time to look at Ark!


# Getting Started

Ark is a self-contained executable, so you can just drop it wherever you want.

In this executable you have:
	- Server
	- Client Application
	- Command-Line Interface (CLI)

Currently we support 3 platforms:
	- Windows x64
	- Linux x64
	- MacOS Intel (Works on Arm)

## Server

To run the server, create an empty folder where you want the root of this server to be. This is the place where the server will store everything.

To initialize and run the server, open the terminal, go to this new folder and run:
	ark.exe server -path ./

The first time running, the server will generate a 4096 bytes RSA private key and an X509 certificate for communication encryption.

## Client Application

There's 2 ways to launch Ark as a client application:
	- Double click ark executable
	- Run ark gui

Since version 0.2.0, there's an option to create Workspaces with built-in servers. This means that when you open the client application, those servers get launched automatically for you.

*Note:* Currently Client Application is only available in Windows.

Please check https://ark-vcs.com/documentation.html for more detailed information about how to use the client application.


## Command-Line Interface

Currently the CLI version is still quite limited, as it hasn't been the focus of the development.

In order to see the commands supported, run
	ark.exe help

To initialize a client, open the terminal on the folder that you want to be your workspace and run:
	ark.exe init -email <email> -host <ip:port>

Here's the some other important ones:
	ark.exe get
	ark.exe changes
	ark.exe commit

## Where does Ark save data?

Data is stored in the following places:
	- Directory where you initialize the server
	- .ark/ inside the directory where you initialize a client workspace
	- C:/Users/{user}/AppData/Local/Ark-Vcs/ for everything else (e.g. preferences, ~/Ark-Vcs/ on Mac and Linux)


# What's Next?

Ark's license model is tied to seats - which mean unique connected users - on the server, and by default if you have no license it defaults to 3 seats.

To find out more about our licenses or if you're interested in getting more seats please visit https://ark-vcs.com/pricing.html. 

Ark is still heavily in development, so expect new releases delivering more functionalities. You can check what's the current short term roadmap in https://ark-vcs.com/roadmap.html.

I'd recommend checking https://ark-vcs.com/documentation.html for more comprehensive documentation.

If you have any questions feel free to get in touch via info@ark-vcs.com, https://discord.gg/Ej8pWEgwQt or https://twitter.com/nafonsopt.
