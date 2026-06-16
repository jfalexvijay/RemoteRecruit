# RemoteRecruit

## Prerequisites

To run the project, ensure your machine meets the following requirements:

* **macOS 26.0** or later
* **Xcode 26.0** or later

## Clone the Repository

Once the required setup is complete, download the project using the following command:

```bash
git clone https://github.com/jfalexvijay/RemoteRecruit.git
```

## Open the Project

After cloning the repository:

1. Navigate to the cloned project folder.
2. Open **RemoteRecruit.xcodeproj** in Xcode.

This will load the project and its configurations in Xcode.

## Running the Application

The **RemoteRecruit** application supports:

* **iOS 16.0** and later

Select an iOS simulator or a connected device and click **Run** in Xcode.

## Running on a Physical iPhone

If you want to run the application on a real iPhone, you must update the **Bundle Identifier** to a unique value associated with your Apple Developer account.

### Steps to Change the Bundle Identifier

1. Open the project in Xcode.
2. Select the **RemoteRecruit** target.
3. Navigate to the **General** tab.
4. Under the **Identity** section, update the **Bundle Identifier** field with a unique identifier.

Example:

```text
com.yourcompany.RemoteRecruit
```

After updating the Bundle Identifier, select your development team in the **Signing & Capabilities** tab and run the application on your device.


## Architecture

The **RemoteRecruit** project follows the **MVVM (Model-View-ViewModel)** architecture pattern, which helps maintain a clear separation of concerns and improves code maintainability, testability, and scalability.


### MVVM Project Structure

There are two common approaches to organizing an MVVM-based project:

1. **Layer-Based Structure**
2. **Feature-Based Structure**

For this project, a **Layer-Based Structure** has been chosen because the application currently consists of a single feature with two screens:

* **Job List**
* **Job Details**

Given the simplicity and size of the application, a Layer-Based Structure provides a clean and organized codebase without introducing unnecessary complexity.

### Project Organization

The project is organized into the following groups:

#### Model

Contains data models used throughout the application.

#### View

Contains SwiftUI views responsible for presenting UI elements to the user.

#### ViewModel

Contains business logic and presentation logic that connects the Views with the Models.

#### Services

Contains network-related services, API handling, and data-fetching logic.

#### Protocols

Contains all protocol definitions used for abstraction, dependency injection, and improved testability.

#### Helpers

Contains extensions, and we can keep other reusable helper components here.

#### App

Contains application-level files, including app entry points and configuration-related files.

### Benefits of This Structure

* Clear separation of responsibilities
* Easy navigation and maintenance
* Improved code reusability
* Better testability through protocol-based abstractions
* Scalable foundation for future enhancements
