debug-drawer-ios
================

Importing target with Git submodule

Add debug-drawer-ios as a submodule by opening the Terminal, cd-ing into your top-level project directory, and entering the command git submodule add https://github.com/eliasbagley/debug-drawer-ios.git
Open the debug-drawer-ios folder, and drag debugrawer.xcodeproj into the file navigator of your app project.
In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
Ensure that the deployment target of debudrawer.xcodeproj matches that of the application target.
In the tab bar at the top of that window, open the "Build Phases" panel.
Expand the "Target Dependencies" group, and add debugdrawer

Setup Pesticide

In your app delegate, simply call
Pesticide.setWindow(myWindow)
to setup Pesticide

Using Pesticide

You can log to the debug drawer using
Pesticide.log("some message")

You can add custom controls to the drawer using any of:

Pesticide.addSwitch(intialValue: Bool, name: String, block: Bool -> ())
Pesticide.addButton(name: String, block: () -> ())
Pesticide.addSlider(initialValue: Float, name: String, block: Float -> ())
Pesticide.addDropdown(initialValue: String, name: String, options: Dictionary<String,AnyObject>, block: (option: AnyObject) -> ())
Pesticide.addLabel(name: String, label: String)
Pesticide.addTextInput(name: String, block: (String) -> ())

The blocks are callbacks used when the value of the control is changed, allowing you to add custom functionality or run code ad hoc

Pesticide.addProxy(block: (NSURLSessionConfiguration?) -> ())
addProxy takes a closure that takes an NSURLSessionConfiguration? object allowing you to plug into whatever networking framework your project uses.
the NSURLSessionConfiguration will be configured based on a host and port. The syntax for the proxy textfield is "host:port"
e.g.
111.11.11.1:8888

