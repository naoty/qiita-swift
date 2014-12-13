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

TODO

## Installation

TODO

## Author

[naoty](https://github.com/naoty)
