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
