public final class TSDKBocModule {

    private var binding: TSDKBindingModule
    public let module: String = "boc"

    public init(binding: TSDKBindingModule) {
        self.binding = binding
    }

    /// Parses message boc into a JSON
    /// JSON structure is compatible with GraphQL API message object
    public func parse_message(_ payload: TSDKParamsOfParse, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "parse_message"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Parses transaction boc into a JSON
    /// JSON structure is compatible with GraphQL API transaction object
    public func parse_transaction(_ payload: TSDKParamsOfParse, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "parse_transaction"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Parses account boc into a JSON
    /// JSON structure is compatible with GraphQL API account object
    public func parse_account(_ payload: TSDKParamsOfParse, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "parse_account"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Parses block boc into a JSON
    /// JSON structure is compatible with GraphQL API block object
    public func parse_block(_ payload: TSDKParamsOfParse, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "parse_block"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Parses shardstate boc into a JSON
    /// JSON structure is compatible with GraphQL API shardstate object
    public func parse_shardstate(_ payload: TSDKParamsOfParseShardstate, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "parse_shardstate"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfParse, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Extract blockchain configuration from key block and also from zerostate.
    public func get_blockchain_config(_ payload: TSDKParamsOfGetBlockchainConfig, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfGetBlockchainConfig, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "get_blockchain_config"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfGetBlockchainConfig, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Calculates BOC root hash
    public func get_boc_hash(_ payload: TSDKParamsOfGetBocHash, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfGetBocHash, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "get_boc_hash"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfGetBocHash, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Extracts code from TVC contract image
    public func get_code_from_tvc(_ payload: TSDKParamsOfGetCodeFromTvc, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfGetCodeFromTvc, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "get_code_from_tvc"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfGetCodeFromTvc, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Get BOC from cache
    public func cache_get(_ payload: TSDKParamsOfBocCacheGet, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfBocCacheGet, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "cache_get"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfBocCacheGet, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Save BOC into cache
    public func cache_set(_ payload: TSDKParamsOfBocCacheSet, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfBocCacheSet, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "cache_set"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfBocCacheSet, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Unpin BOCs with specified pin.
    /// BOCs which don't have another pins will be removed from cache
    public func cache_unpin(_ payload: TSDKParamsOfBocCacheUnpin, _ handler: @escaping (TSDKBindingResponse<TSDKNoneResult, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "cache_unpin"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKNoneResult, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

    /// Encodes BOC from builder operations.
    public func encode_boc(_ payload: TSDKParamsOfEncodeBoc, _ handler: @escaping (TSDKBindingResponse<TSDKResultOfEncodeBoc, TSDKClientError, TSDKDefault>) -> Void
    ) {
        let method: String = "encode_boc"
        binding.requestLibraryAsync(methodName(module, method), payload, { (requestId, params, responseType, finished) in
            var response: TSDKBindingResponse<TSDKResultOfEncodeBoc, TSDKClientError, TSDKDefault> = .init()
            response.update(requestId, params, responseType, finished)
            handler(response)
        })
    }

}
