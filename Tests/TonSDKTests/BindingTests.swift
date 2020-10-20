//
//  Created by Oleh Hudeichuk on 18.10.2020.
//

import XCTest
import class Foundation.Bundle
@testable import TonSDK
@testable import CTonSDK

final class BindingTests: XCTestCase {

    func testConvertToTSDKString() throws {
        var string: TSDKString = .init()
        TSDKBinding.convertToTSDKString("Hello😀") { tsdkString in
            string = tsdkString
        }
        XCTAssertEqual(string.len, 9)
    }

    func testConvertFromTSDKString() throws {
        var swiftString: String = .init()
        TSDKBinding.convertToTSDKString("Hello😀") { tsdkString in
            swiftString = TSDKBinding.convertFromTSDKString(tsdkString)
        }
        XCTAssertEqual(swiftString, "Hello😀")
    }

    struct Test: Decodable {
        var version: String
    }

    struct TestError: Decodable {
        var code: UInt32
        var message: String
        var data: AnyJSONType
    }

    func testRequestLibraryAsync() throws {
        let binding: TSDKBinding = .init()
        for _ in 1...500 {
            binding.requestLibraryAsync("client.version", "{}") { (r: TSDKBindingResponse<Test, TestError, Test>) in
                XCTAssertEqual(r.result?.version, "1.0.0")
            }
        }
        usleep(500000)
    }
}

