# qiita-swift

Qiita API v2 client for Swift

## Demo

```swift
let client = Qiita.Client(accessToken: "...")
let request = client.getItems()
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
