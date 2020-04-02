# PauContainer

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PauContainer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PauContainer'
```

## Usage
Once the library is integrated in your project through Cocoapods:

1. Import the framework wherever is needed:

    ```
    import PauContainer
    ```
2. Create a container to use

    ```
    let container = PauContainer()
    ```
3. Create a definition for the object to store in the container

    ```
    let objectToStore = "Hello, container"
    let definition = Definition(objectToStore)
    ```
5. Store the definition inside the container
    ```
    container.register(definition)
    ```
4. Retrieve the object where needed by its type

    ```
    let restoredObject = container.resolve() as String
    ```
## Author

Pau Ruiz, pau@iosnow.net

## License

PauContainer is available under the MIT license. See the LICENSE file for more info.
