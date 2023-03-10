# SwiftUIBuddy

## Description
SwiftUIBuddy is a collection of beautiful, easy-to-use components for your SwiftUI App. It contains custom Buttons, Pickers, Progress Views, Text Fields, and so much more! All of the components are highly customizable and built using 100% SwiftUI.

## Motivation
The framework was designed with simplicity and functionality in mind. It strives to resemble Apple's design style and follow Human Interface Guidelines. For increased stability, SwiftUIBuddy does not depend on any 3rd party libraries or frameworks and is written only using native components provided by SwiftUI.

## Wiki
How to use SwiftUIBuddy Components:

### Buttons

**&nbsp;&nbsp;&nbsp;&nbsp; StandardButton**  

<img src = "Screenshots/Buttons/StandardButton.png" height = "80">

```swift
StandardButton("Standard Button") {
    print("Button Tapped")
}
```
-----

**&nbsp;&nbsp;&nbsp;&nbsp; DestructiveButton**  
<img src = "Screenshots/Buttons/DestructiveButton.png" height = "151">

```swift
DestructiveButton("Delete Account", style: .bordered) {
    deleteAccount()
}

DestructiveButton("Remove Connection") {
    removeConnection()
}
```
-----

**&nbsp;&nbsp;&nbsp;&nbsp; PlusButton**  
<img src = "Screenshots/Buttons/PlusButton.png" height = "85">

```swift
PlusButton(color: .cyan) {
    addNewFile()
}
```
-----

**&nbsp;&nbsp;&nbsp;&nbsp; DismissButton**  
&nbsp;&nbsp; <img src = "Screenshots/Buttons/DismissButton.png" height = "50">

```swift
DismissButton {
    showingSheet = false
}
```
-----

### Progress Views
**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CapsuleProgressBar**  
<img src = "Screenshots/Progress Views/CapsuleProgressBar.png" height = "50">

```swift
CapsuleProgressBar(currentStage: 4, totalStages: 5)
```
-----

**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LoadingSpinner**  
&nbsp;<img src = "Screenshots/Progress Views/LoadingSpinner.png" height = "110">

```swift
LoadingSpinner()
```
-----

### Fields
**&nbsp;&nbsp;&nbsp; LoginField**  
<br/>
&nbsp;&nbsp; <img src = "Screenshots/Fields/LoginField.png" height = "130">

```swift
LoginField("Email", text: $email)
LoginField("Password", text: $password, fieldType: .password)
```
-----

**&nbsp;&nbsp;&nbsp; DollarTextField**  
<br/>
&nbsp;&nbsp; <img src = "Screenshots/Fields/DollarTextField.png" height = "40">

```swift
DollarTextField(9.40, amount: $price)
```
-----

### Pickers
**&nbsp;&nbsp;&nbsp; TwitterPicker**  
<br/>
&nbsp;&nbsp;&nbsp; <img src = "Screenshots/Pickers/TwitterPicker.png" height = "70">

```swift
TwitterPicker(choices: ["Ramen", "Miso", "Pho"], selectedIndex: $soup)
```
-----

**&nbsp;&nbsp;&nbsp; RadioPicker**  
<br/>
&nbsp;&nbsp;&nbsp; <img src = "Screenshots/Pickers/RadioPicker.png" height = "120">

```swift
RadioPicker(choices: ["Male", "Female", "Non-Binary"], selectedChoice: $gender)
```
-----

### Helper Tools
**&nbsp;&nbsp;&nbsp; Spacers**  
<br/>
&nbsp;&nbsp;&nbsp; <img src = "Screenshots/Helper Tools/Spacer.png" height = "100">
<img src = "Screenshots/Helper Tools/Spacers.png" height = "100">

```swift
Spacers(4)
```
-----

**&nbsp;&nbsp;&nbsp; Dividers**  
<br/>
<!--&nbsp;&nbsp;&nbsp; <img src = "Screenshots/Helper Tools/Spacer.png" height = "100">-->
<!--<img src = "Screenshots/Helper Tools/Spacers.png" height = "100">-->

```swift
Dividers(6)
```
-----

## How to Install
1) Go to Xcode -> File -> Add Packages
2) Paste https://github.com/Daniel-Berezhnoy/SwiftUIBuddy into the search bar
3) Confirm and install the Package
4) Import **SwiftUIBuddy** in the file(s) where you want to use it

```swift
import SwiftUIBuddy
```

## Notes
The minimum deployment target is iOS 15.0. This project is a work-in-progress, so expect it to grow, and feel free to contribute.
