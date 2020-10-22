//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.10.2020.
//

import Foundation

public final class TSDKAbi {

    private var binding: TSDKBinding
    public let module: String = "abi"

    public init(binding: TSDKBinding) {
        self.binding = binding
    }

    public func encode_message_body(_ payload: TSDKParamsOfEncodeMessageBody,
                                    _ handler: @escaping (TSDKBindingResponse<TSDKResultOfEncodeMessageBody, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "encode_message_body"
        binding.requestLibraryAsync(methodName(module, method), payload, { (response) in
            handler(response)
        })
    }

    public func attach_signature_to_message_body(_ payload: TSDKParamsOfAttachSignatureToMessageBody,
                                                 _ handler: @escaping (TSDKBindingResponse<TSDKResultOfAttachSignatureToMessageBody, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "attach_signature_to_message_body"
        binding.requestLibraryAsync(methodName(module, method), payload, { (response) in
            handler(response)
        })
    }

    public func encode_message(_ payload: TSDKParamsOfEncodeMessage,
                               _ handler: @escaping (TSDKBindingResponse<TSDKResultOfEncodeMessage, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "encode_message"
        binding.requestLibraryAsync(methodName(module, method), payload, { (response) in
            handler(response)
        })
    }

    public func attach_signature(_ payload: TSDKParamsOfAttachSignature,
                                 _ handler: @escaping (TSDKBindingResponse<TSDKResultOfAttachSignature, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "attach_signature"
        binding.requestLibraryAsync(methodName(module, method), payload, { (response) in
            handler(response)
        })
    }

    public func decode_message(_ payload: TSDKParamsOfDecodeMessage,
                               _ handler: @escaping (TSDKBindingResponse<TSDKDecodedMessageBody, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "decode_message"
        binding.requestLibraryAsync(methodName(module, method), payload, { (response) in
            handler(response)
        })
    }

    public func decode_message_body(_ payload: TSDKParamsOfDecodeMessageBody,
                                    _ handler: @escaping (TSDKBindingResponse<TSDKDecodedMessageBody, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "decode_message_body"
        binding.requestLibraryAsync(methodName(module, method), payload, { (response) in
            handler(response)
        })
    }

    public func encode_account(_ payload: TSDKParamsOfEncodeAccount,
                               _ handler: @escaping (TSDKBindingResponse<TSDKResultOfEncodeAccount, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "encode_account"
        binding.requestLibraryAsync(methodName(module, method), payload, { (response) in
            handler(response)
        })
    }
}