# SwiftUI Computed Views Demo

A small runnable project for the companion article, "Your SwiftUI Subviews Are Fake. SwiftUI Never Sees Them."

One profile screen with a name field and a notifications toggle, built four different ways. Every view prints to the Xcode console with `Self._printChanges()`, and the settings part prints its own "settings part rebuilt" line, so you can see exactly what rebuilds when you type or tap.

## What is inside

- `ProfileView` splits its `body` into computed properties. Typing a name rebuilds the whole screen
- `ExtractedProfileView` moves the toggle into a real `SettingsSection` view that takes one binding and owns its own help sheet state
- `WholeViewModelProfileView` shows the halfway step, a separate `NameSection` struct that still observes the whole view model
- `ObservableProfileView` uses `@Observable`, with a real `NameField` view next to a computed `nicknameField` property
- `ComputedViewsDemoTests` checks the two observation rules behind the article, using Swift Testing

`Self._printChanges()` and the `print` calls are debugging aids. They are in the views here on purpose, but leave them out of production code.

## Requirements

- Xcode 16 or later
- iOS 17 or later

## Run it

This project is set up for XcodeGen, a tool that turns a plain YAML file into a real Xcode project.

1. Install XcodeGen once, with Homebrew.

   brew install xcodegen

2. From this folder, generate the project.

   xcodegen generate

3. Open it.

   open ComputedViewsDemo.xcodeproj

4. Pick an iPhone simulator and run. Run the tests with Cmd+U.

If you would rather not install XcodeGen, create a new Xcode project named ComputedViewsDemo, iOS App, SwiftUI, Swift, with Swift Testing as the testing system. Delete its generated ContentView.swift, ComputedViewsDemoApp.swift and test file, then add Sources/ComputedViewsDemo to the app target and Tests/ComputedViewsDemoTests to the test target. Set the deployment target to iOS 17.

## What to try

Open the console with Cmd+Shift+Y, then use the four tabs.

The settings part prints "settings part rebuilt" every time its code runs, in both of the first two tabs, so you can compare them directly.

1. **Computed.** Type in Name. Every keystroke prints a `ProfileView` line followed by "settings part rebuilt". The toggle is rebuilt even though only the name changed.
2. **Extracted.** Type in Name. Every keystroke prints an `ExtractedProfileView` line, but "settings part rebuilt" never appears, and `SettingsSection` and `StatusRow` stay quiet. Tap "What is this?" and only `SettingsSection` prints.
3. **Whole VM.** Flip Notifications. `NameSection` prints too, even though it only shows the name.
4. **Observable.** Type in Name and only `NameField` prints. Type in Nickname and the parent `ObservableProfileView` prints, because that field is a computed property.
