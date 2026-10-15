# SwiftUI Computed Views Demo

A small runnable project that shows why splitting a SwiftUI `body` into computed `some View` properties rebuilds more than you expect, and how real view structs fix it.

One profile screen with a name field and a notifications toggle, built four different ways. Every view prints to the Xcode console with `Self._printChanges()`, and the settings part prints its own "settings part rebuilt" line, so you can see exactly what rebuilds when you type or tap.

## What is inside

- `ProfileView` splits its `body` into computed properties. Typing a name rebuilds the whole screen
- `ExtractedProfileView` moves the toggle into a real `SettingsSection` view that takes one binding and owns its own help sheet state
- `WholeViewModelProfileView` shows the halfway step, a separate `NameSection` struct that still observes the whole view model
- `ObservableProfileView` uses `@Observable`, with a real `NameField` view next to a computed `nicknameField` property
- `ComputedViewsDemoTests` checks the two observation rules behind this behaviour, using Swift Testing

`Self._printChanges()` and the `print` calls are debugging aids. They are in the views here on purpose, but leave them out of production code.

## Requirements

- Xcode 16 or later
- iOS 17 or later

## Run it

1. Clone the repo and open `ComputedViewsDemo.xcodeproj`.
2. Pick an iPhone simulator and run with Cmd+R.
3. Run the tests with Cmd+U.

## What to try

Open the console with Cmd+Shift+Y, then use the four tabs.

The settings part prints "settings part rebuilt" every time its code runs, in both of the first two tabs, so you can compare them directly.

1. **Computed.** Type in Name. Every keystroke prints a `ProfileView` line followed by "settings part rebuilt". The toggle is rebuilt even though only the name changed.
2. **Extracted.** Type in Name. Every keystroke prints an `ExtractedProfileView` line, but "settings part rebuilt" never appears, and `SettingsSection` and `StatusRow` stay quiet. Tap "What is this?" and only `SettingsSection` prints.
3. **Whole VM.** Flip Notifications. `NameSection` prints too, even though it only shows the name.
4. **Observable.** Type in Name and only `NameField` prints. Type in Nickname and the parent `ObservableProfileView` prints, because that field is a computed property.
