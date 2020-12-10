# Swift Client for Free Ton SDK

[![SPM](https://img.shields.io/badge/swift-package%20manager-green)](https://swift.org/package-manager/)

Swift is a strongly typed language that has long been used not only for iOS development. Apple is actively promoting it to new platforms and today it can be used for almost any task. Thanks to this, this implementation provides the work of TonSDK on many platforms at once, including the native one for mobile phones. Let me remind you that swift can also be built for android.

| OS | Result |
| ----------- | ----------- |
| MacOS | ✅ |
| Linux | ✅ |
| iOS | ✅ |
| Windows | Soon |

## Usage

All requests are async

```swift
import TonClientSwift

var config: TSDKClientConfig = .init()
config.network = TSDKNetworkConfig(server_address: "https://net.ton.dev")
let client: TSDKClientModule = .init(config: config)

// Crypto
client.crypto.factorize(TSDKParamsOfFactorize(composite: "17ED48941A08F981")) { (response) in
    print(response.result?.factors)
}

// Boc
let payload: TSDKParamsOfParse = .init(bocEncodedBase64: "te6ccgEBAQEAWAAAq2n+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE/zMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzSsG8DgAAAAAjuOu9NAL7BxYpA")
client.boc.parse_message(payload) { (response) in
    if let result = response.result, let parsed: [String: Any] = result.parsed.toDictionary() {
        print(parsed["id"])
        print(parsed["src"])
        print(parsed["dst"])
    }
}
```

## Errors

```swift
client.crypto.factorize(TSDKParamsOfFactorize(composite: "17ED48941A08F981")) { (response) in
    if let error = response.error {
        print(error.data.toJSON())
        print(error.code)
    }
}
```

## Setup TONSDK For Linux and MacOS

### Install sdk with bash script

0. ```cd path_to_this_library```
1. ```bash ./scripts/install_tonsdk_desktop.sh```

## Setup TONSDK For iOS

1.   ```cargo install cargo-lipo```   
2. ```rustup target add aarch64-apple-ios x86_64-apple-ios```   
3. 
```
cd ./TON-SDK
cargo lipo --release
```  
4. In xcode __File > Add files to "Name Your Project"__ navigate to ./TON-SDK/ton_client/tonclient.h
5. Create bridge. In xcode __File > New > File__, select Header File, set name for example Tonclient-Bridging-Header.h and add this code:   
```C
#ifndef Tonclient_Bridging_Header_h
#define Tonclient_Bridging_Header_h

#include <stdbool.h>
#import "tonclient.h"

#endif
```   
6. Add path to search for bridge headers ( path to Tonclient-Bridging-Header.h )  
![](https://user-images.githubusercontent.com/10519803/101163840-e736d480-363c-11eb-8ffe-022eec57a7ed.png)
7. Add path to search for libraries ( path to directory withlibton_client.a )   
![](https://user-images.githubusercontent.com/10519803/101163634-8c04e200-363c-11eb-8ad9-6eea755d05f4.png)
8. Build ...

## Tests
### If you use Xcode for Test

Please, set custom working directory to project folder for your xcode scheme. This is necessary for the relative path "./" to this library folders.
You may change it with the xcode edit scheme menu __Product > Scheme > Edit Scheme__ menu __Run__ submenu __Options__ enable checkbox "Use custom directory" and add custom working directory.  

Or if above variant not available, then inside file path_to_this_library/.swiftpm/xcode/xcshareddata/xcschemes/TonClientSwift.xcscheme
set to tag __"LaunchAction"__ absolute path to this library with options:   
**useCustomWorkingDirectory = "YES"**  
**customWorkingDirectory = "/path_to_this_library"**  


Tests

1. inside root directory of ton-client-swift create **.env.debug** file with
NET TON DEV
```
server_address=https://net.ton.dev
giver_address=0:653b9a6452c7a982c6dc92b2da9eba832ade1c467699ebb3b43dca6d77b780dd
giver_abi_name=Giver
giver_function=grant
```
**Optional:** Install locale NodeSE for tests if you needed:    
- launch docker  
- docker run -d --name local-node -p 80:80 tonlabs/local-node   
nodeSE will start on localhost:80   
```
server_address=http://localhost:80
giver_address=0:841288ed3b55d9cdafa806807f02a0ae0c169aa5edfe88a789a6482429756a94
giver_abi_name=GiverNodeSE
giver_function=sendGrams
giver_amount=10000000000
```

2. Run Tests  
MacOS:  
Run Tests inside Xcode  
Linux:  
swift test --generate-linuxmain  
swift test --enable-test-discovery  
