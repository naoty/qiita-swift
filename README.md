# qiita-swift

Qiita API v2 client for Swift

## Example

```swift
let client = Qiita.Client(accessToken: "...")

let parameters = ["query": "user:naoty_k"]
let request = client.getItems(parameters: parameters)
request.onComplete { items in
  // ...
}
request.onError { error in
  // ...
}
request.resume()
```

## Usage

### Items
* `Qiita.Client.getItems(parameters: [String:String] = [:])`: Get the collection of items.
* `Qiita.Client.getItem(id: String, parameters: [String:String] = [:])`: Get a speficied item.

### Users
* `Qiita.Client.getUsers(parameters: [String:String] = [:])`: Get the collection of users.
* `Qiita.Client.getUser(id: String, parameters: [String:String] = [:])`: Get a speficied user.

## Installation

TODO

## Author

[naoty](https://github.com/naoty)
