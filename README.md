# Background
The Radix wallet for iOS is built in SwiftUI using [TCA](https://github.com/pointfreeco/swift-composable-architecture/), which is an architecture library based on the ideas behind Redux, such as unidirectional dataflow. It simplifies things like separating the logic from the view code, reusing views and testing, but it also comes with its own limitations and challenges. In particular, our app contains a large number of "flows", sequences of screens, which is something that TCA does not handle very well yet.

# Assignment 
Your assignment consists of implementing a flow using TCA and SwiftUI.

## Flow chart
```
 - Splash screen - just text

 Onboarding:
 - Welcome screen - just text
 - Enter year of birth
    If the age is above 18 then show the naming flow:
    - Enter first name
    - Enter family name
    - Name completion screen - show the full name
 - Onboarding completion - just text. This is when the details are saved

 - Home screen - shows year of birth and, if applicable, full name

For adults, the home screen also has a "Update name" button that kicks off the naming flow
```

## Requirements
* The flow is nested, and the inner, naming flow, should be reusable standalone
* It should use [TCA navigation](https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/navigation/) and the individual screens should be pushed in from the side - it should use a NavigationView or -Stack
* The naming flow should be an integral part of the full flow, rather than shown on a sheet or similar
* The values entered should be saved using a `@Dependency` - a TCA concept - at least to memory, but only when reaching Onboarding completion
* The visual design is not important, but it should use SwiftUI best practices
* You are free to use iOS 16 as minimum deployment target (we use iOS 16 in our app).
* User should be able to go back to previous screens in onboarding, including going from the naming flow back to the age screen

# Recommendations
* We will evaluate your solution from an architecture and navigation perspective
* Clear and elegant Swift code is very important
