# qiita-swift

Qiita API v2 client for Swift

## Example

```swift
let client = Qiita.Client(accessToken: "...")
// let client = Qiita.Client(accessToken: "...", baseURLString: "http://*.qiita.com/api/v2")

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
* `Qiita.Client.getItems(parameters: [String:String] = [:])`
* `Qiita.Client.getItem(id: String, parameters: [String:String] = [:])`
* `Qiita.Client.getUserItems(userID: String, parameters: [String:String] = [:])`
* `Qiita.Client.getUserStocks(userID: String, parameters: [String:String] = [:])`

### Users
* `Qiita.Client.getUsers(parameters: [String:String] = [:])`
* `Qiita.Client.getUser(id: String, parameters: [String:String] = [:])`
* `Qiita.Client.getAuthorizedUser()`
* `Qiita.Client.getFollowees(id: String, parameters: [String:String] = [:])`
* `Qiita.Client.getFollowers(id: String, parameters: [String:String] = [:])`

## Installation

TODO

## Author

[naoty](https://github.com/naoty)
