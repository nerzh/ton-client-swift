public typealias TSDKSigningBoxHandle = UInt32

public typealias TSDKEncryptionBoxHandle = UInt32

public enum TSDKCryptoErrorCode: Int, Codable {
    case InvalidPublicKey = 100
    case InvalidSecretKey = 101
    case InvalidKey = 102
    case InvalidFactorizeChallenge = 106
    case InvalidBigInt = 107
    case ScryptFailed = 108
    case InvalidKeySize = 109
    case NaclSecretBoxFailed = 110
    case NaclBoxFailed = 111
    case NaclSignFailed = 112
    case Bip39InvalidEntropy = 113
    case Bip39InvalidPhrase = 114
    case Bip32InvalidKey = 115
    case Bip32InvalidDerivePath = 116
    case Bip39InvalidDictionary = 117
    case Bip39InvalidWordCount = 118
    case MnemonicGenerationFailed = 119
    case MnemonicFromEntropyFailed = 120
    case SigningBoxNotRegistered = 121
    case InvalidSignature = 122
    case EncryptionBoxNotRegistered = 123
}

public enum TSDKParamsOfAppSigningBoxEnumTypes: String, Codable {
    case GetPublicKey = "GetPublicKey"
    case Sign = "Sign"
}

public enum TSDKResultOfAppSigningBoxEnumTypes: String, Codable {
    case GetPublicKey = "GetPublicKey"
    case Sign = "Sign"
}

public enum TSDKParamsOfAppEncryptionBoxEnumTypes: String, Codable {
    case GetInfo = "GetInfo"
    case Encrypt = "Encrypt"
    case Decrypt = "Decrypt"
}

public enum TSDKResultOfAppEncryptionBoxEnumTypes: String, Codable {
    case GetInfo = "GetInfo"
    case Encrypt = "Encrypt"
    case Decrypt = "Decrypt"
}

public struct TSDKEncryptionBoxInfo: Codable {
    /// Derivation path, for instance "m/44'/396'/0'/0/0"
    public var hdpath: String?
    /// Cryptographic algorithm, used by this encryption box
    public var algorithm: String?
    /// Options, depends on algorithm and specific encryption box implementation
    public var options: AnyValue?
    /// Public information, depends on algorithm
    public var `public`: AnyValue?

    public init(hdpath: String? = nil, algorithm: String? = nil, options: AnyValue? = nil, `public`: AnyValue? = nil) {
        self.hdpath = hdpath
        self.algorithm = algorithm
        self.options = options
        self.`public` = `public`
    }
}

public struct TSDKParamsOfFactorize: Codable {
    /// Hexadecimal representation of u64 composite number.
    public var composite: String

    public init(composite: String) {
        self.composite = composite
    }
}

public struct TSDKResultOfFactorize: Codable {
    /// Two factors of composite or empty if composite can't be factorized.
    public var factors: [String]

    public init(factors: [String]) {
        self.factors = factors
    }
}

public struct TSDKParamsOfModularPower: Codable {
    /// `base` argument of calculation.
    public var base: String
    /// `exponent` argument of calculation.
    public var exponent: String
    /// `modulus` argument of calculation.
    public var modulus: String

    public init(base: String, exponent: String, modulus: String) {
        self.base = base
        self.exponent = exponent
        self.modulus = modulus
    }
}

public struct TSDKResultOfModularPower: Codable {
    /// Result of modular exponentiation
    public var modular_power: String

    public init(modular_power: String) {
        self.modular_power = modular_power
    }
}

public struct TSDKParamsOfTonCrc16: Codable {
    /// Input data for CRC calculation.
    /// Encoded with `base64`.
    public var data: String

    public init(data: String) {
        self.data = data
    }
}

public struct TSDKResultOfTonCrc16: Codable {
    /// Calculated CRC for input data.
    public var crc: UInt16

    public init(crc: UInt16) {
        self.crc = crc
    }
}

public struct TSDKParamsOfGenerateRandomBytes: Codable {
    /// Size of random byte array.
    public var length: UInt32

    public init(length: UInt32) {
        self.length = length
    }
}

public struct TSDKResultOfGenerateRandomBytes: Codable {
    /// Generated bytes encoded in `base64`.
    public var bytes: String

    public init(bytes: String) {
        self.bytes = bytes
    }
}

public struct TSDKParamsOfConvertPublicKeyToTonSafeFormat: Codable {
    /// Public key - 64 symbols hex string
    public var public_key: String

    public init(public_key: String) {
        self.public_key = public_key
    }
}

public struct TSDKResultOfConvertPublicKeyToTonSafeFormat: Codable {
    /// Public key represented in TON safe format.
    public var ton_public_key: String

    public init(ton_public_key: String) {
        self.ton_public_key = ton_public_key
    }
}

public struct TSDKKeyPair: Codable {
    /// Public key - 64 symbols hex string
    public var `public`: String
    /// Private key - u64 symbols hex string
    public var secret: String

    public init(`public`: String, secret: String) {
        self.`public` = `public`
        self.secret = secret
    }
}

public struct TSDKParamsOfSign: Codable {
    /// Data that must be signed encoded in `base64`.
    public var unsigned: String
    /// Sign keys.
    public var keys: TSDKKeyPair

    public init(unsigned: String, keys: TSDKKeyPair) {
        self.unsigned = unsigned
        self.keys = keys
    }
}

public struct TSDKResultOfSign: Codable {
    /// Signed data combined with signature encoded in `base64`.
    public var signed: String
    /// Signature encoded in `hex`.
    public var signature: String

    public init(signed: String, signature: String) {
        self.signed = signed
        self.signature = signature
    }
}

public struct TSDKParamsOfVerifySignature: Codable {
    /// Signed data that must be verified encoded in `base64`.
    public var signed: String
    /// Signer's public key - 64 symbols hex string
    public var `public`: String

    public init(signed: String, `public`: String) {
        self.signed = signed
        self.`public` = `public`
    }
}

public struct TSDKResultOfVerifySignature: Codable {
    /// Unsigned data encoded in `base64`.
    public var unsigned: String

    public init(unsigned: String) {
        self.unsigned = unsigned
    }
}

public struct TSDKParamsOfHash: Codable {
    /// Input data for hash calculation.
    /// Encoded with `base64`.
    public var data: String

    public init(data: String) {
        self.data = data
    }
}

public struct TSDKResultOfHash: Codable {
    /// Hash of input `data`.
    /// Encoded with 'hex'.
    public var hash: String

    public init(hash: String) {
        self.hash = hash
    }
}

public struct TSDKParamsOfScrypt: Codable {
    /// The password bytes to be hashed. Must be encoded with `base64`.
    public var password: String
    /// Salt bytes that modify the hash to protect against Rainbow table attacks. Must be encoded with `base64`.
    public var salt: String
    /// CPU/memory cost parameter
    public var log_n: UInt8
    /// The block size parameter, which fine-tunes sequential memory read size and performance.
    public var r: UInt32
    /// Parallelization parameter.
    public var p: UInt32
    /// Intended output length in octets of the derived key.
    public var dk_len: UInt32

    public init(password: String, salt: String, log_n: UInt8, r: UInt32, p: UInt32, dk_len: UInt32) {
        self.password = password
        self.salt = salt
        self.log_n = log_n
        self.r = r
        self.p = p
        self.dk_len = dk_len
    }
}

public struct TSDKResultOfScrypt: Codable {
    /// Derived key.
    /// Encoded with `hex`.
    public var key: String

    public init(key: String) {
        self.key = key
    }
}

public struct TSDKParamsOfNaclSignKeyPairFromSecret: Codable {
    /// Secret key - unprefixed 0-padded to 64 symbols hex string
    public var secret: String

    public init(secret: String) {
        self.secret = secret
    }
}

public struct TSDKParamsOfNaclSign: Codable {
    /// Data that must be signed encoded in `base64`.
    public var unsigned: String
    /// Signer's secret key - unprefixed 0-padded to 64 symbols hex string
    public var secret: String

    public init(unsigned: String, secret: String) {
        self.unsigned = unsigned
        self.secret = secret
    }
}

public struct TSDKResultOfNaclSign: Codable {
    /// Signed data, encoded in `base64`.
    public var signed: String

    public init(signed: String) {
        self.signed = signed
    }
}

public struct TSDKParamsOfNaclSignOpen: Codable {
    /// Signed data that must be unsigned.
    /// Encoded with `base64`.
    public var signed: String
    /// Signer's public key - unprefixed 0-padded to 64 symbols hex string
    public var `public`: String

    public init(signed: String, `public`: String) {
        self.signed = signed
        self.`public` = `public`
    }
}

public struct TSDKResultOfNaclSignOpen: Codable {
    /// Unsigned data, encoded in `base64`.
    public var unsigned: String

    public init(unsigned: String) {
        self.unsigned = unsigned
    }
}

public struct TSDKResultOfNaclSignDetached: Codable {
    /// Signature encoded in `hex`.
    public var signature: String

    public init(signature: String) {
        self.signature = signature
    }
}

public struct TSDKParamsOfNaclSignDetachedVerify: Codable {
    /// Unsigned data that must be verified.
    /// Encoded with `base64`.
    public var unsigned: String
    /// Signature that must be verified.
    /// Encoded with `hex`.
    public var signature: String
    /// Signer's public key - unprefixed 0-padded to 64 symbols hex string.
    public var `public`: String

    public init(unsigned: String, signature: String, `public`: String) {
        self.unsigned = unsigned
        self.signature = signature
        self.`public` = `public`
    }
}

public struct TSDKResultOfNaclSignDetachedVerify: Codable {
    /// `true` if verification succeeded or `false` if it failed
    public var succeeded: Bool

    public init(succeeded: Bool) {
        self.succeeded = succeeded
    }
}

public struct TSDKParamsOfNaclBoxKeyPairFromSecret: Codable {
    /// Secret key - unprefixed 0-padded to 64 symbols hex string
    public var secret: String

    public init(secret: String) {
        self.secret = secret
    }
}

public struct TSDKParamsOfNaclBox: Codable {
    /// Data that must be encrypted encoded in `base64`.
    public var decrypted: String
    /// Nonce, encoded in `hex`
    public var nonce: String
    /// Receiver's public key - unprefixed 0-padded to 64 symbols hex string
    public var their_public: String
    /// Sender's private key - unprefixed 0-padded to 64 symbols hex string
    public var secret: String

    public init(decrypted: String, nonce: String, their_public: String, secret: String) {
        self.decrypted = decrypted
        self.nonce = nonce
        self.their_public = their_public
        self.secret = secret
    }
}

public struct TSDKResultOfNaclBox: Codable {
    /// Encrypted data encoded in `base64`.
    public var encrypted: String

    public init(encrypted: String) {
        self.encrypted = encrypted
    }
}

public struct TSDKParamsOfNaclBoxOpen: Codable {
    /// Data that must be decrypted.
    /// Encoded with `base64`.
    public var encrypted: String
    public var nonce: String
    /// Sender's public key - unprefixed 0-padded to 64 symbols hex string
    public var their_public: String
    /// Receiver's private key - unprefixed 0-padded to 64 symbols hex string
    public var secret: String

    public init(encrypted: String, nonce: String, their_public: String, secret: String) {
        self.encrypted = encrypted
        self.nonce = nonce
        self.their_public = their_public
        self.secret = secret
    }
}

public struct TSDKResultOfNaclBoxOpen: Codable {
    /// Decrypted data encoded in `base64`.
    public var decrypted: String

    public init(decrypted: String) {
        self.decrypted = decrypted
    }
}

public struct TSDKParamsOfNaclSecretBox: Codable {
    /// Data that must be encrypted.
    /// Encoded with `base64`.
    public var decrypted: String
    /// Nonce in `hex`
    public var nonce: String
    /// Secret key - unprefixed 0-padded to 64 symbols hex string
    public var key: String

    public init(decrypted: String, nonce: String, key: String) {
        self.decrypted = decrypted
        self.nonce = nonce
        self.key = key
    }
}

public struct TSDKParamsOfNaclSecretBoxOpen: Codable {
    /// Data that must be decrypted.
    /// Encoded with `base64`.
    public var encrypted: String
    /// Nonce in `hex`
    public var nonce: String
    /// Public key - unprefixed 0-padded to 64 symbols hex string
    public var key: String

    public init(encrypted: String, nonce: String, key: String) {
        self.encrypted = encrypted
        self.nonce = nonce
        self.key = key
    }
}

public struct TSDKParamsOfMnemonicWords: Codable {
    /// Dictionary identifier
    public var dictionary: TSDKMnemonicDictionary?

    public init(dictionary: TSDKMnemonicDictionary? = nil) {
        self.dictionary = dictionary
    }
}

public struct TSDKResultOfMnemonicWords: Codable {
    /// The list of mnemonic words
    public var words: String

    public init(words: String) {
        self.words = words
    }
}

public struct TSDKParamsOfMnemonicFromRandom: Codable {
    /// Dictionary identifier
    public var dictionary: TSDKMnemonicDictionary?
    /// Mnemonic word count
    public var word_count: UInt8?

    public init(dictionary: TSDKMnemonicDictionary? = nil, word_count: UInt8? = nil) {
        self.dictionary = dictionary
        self.word_count = word_count
    }
}

public struct TSDKResultOfMnemonicFromRandom: Codable {
    /// String of mnemonic words
    public var phrase: String

    public init(phrase: String) {
        self.phrase = phrase
    }
}

public struct TSDKParamsOfMnemonicFromEntropy: Codable {
    /// Entropy bytes.
    /// Hex encoded.
    public var entropy: String
    /// Dictionary identifier
    public var dictionary: TSDKMnemonicDictionary?
    /// Mnemonic word count
    public var word_count: UInt8?

    public init(entropy: String, dictionary: TSDKMnemonicDictionary? = nil, word_count: UInt8? = nil) {
        self.entropy = entropy
        self.dictionary = dictionary
        self.word_count = word_count
    }
}

public struct TSDKResultOfMnemonicFromEntropy: Codable {
    /// Phrase
    public var phrase: String

    public init(phrase: String) {
        self.phrase = phrase
    }
}

public struct TSDKParamsOfMnemonicVerify: Codable {
    /// Phrase
    public var phrase: String
    /// Dictionary identifier
    public var dictionary: TSDKMnemonicDictionary?
    /// Word count
    public var word_count: UInt8?

    public init(phrase: String, dictionary: TSDKMnemonicDictionary? = nil, word_count: UInt8? = nil) {
        self.phrase = phrase
        self.dictionary = dictionary
        self.word_count = word_count
    }
}

public struct TSDKResultOfMnemonicVerify: Codable {
    /// Flag indicating if the mnemonic is valid or not
    public var valid: Bool

    public init(valid: Bool) {
        self.valid = valid
    }
}

public struct TSDKParamsOfMnemonicDeriveSignKeys: Codable {
    /// Phrase
    public var phrase: String
    /// Derivation path, for instance "m/44'/396'/0'/0/0"
    public var path: String?
    /// Dictionary identifier
    public var dictionary: TSDKMnemonicDictionary?
    /// Word count
    public var word_count: UInt8?

    public init(phrase: String, path: String? = nil, dictionary: TSDKMnemonicDictionary? = nil, word_count: UInt8? = nil) {
        self.phrase = phrase
        self.path = path
        self.dictionary = dictionary
        self.word_count = word_count
    }
}

public struct TSDKParamsOfHDKeyXPrvFromMnemonic: Codable {
    /// String with seed phrase
    public var phrase: String
    /// Dictionary identifier
    public var dictionary: TSDKMnemonicDictionary?
    /// Mnemonic word count
    public var word_count: UInt8?

    public init(phrase: String, dictionary: TSDKMnemonicDictionary? = nil, word_count: UInt8? = nil) {
        self.phrase = phrase
        self.dictionary = dictionary
        self.word_count = word_count
    }
}

public struct TSDKResultOfHDKeyXPrvFromMnemonic: Codable {
    /// Serialized extended master private key
    public var xprv: String

    public init(xprv: String) {
        self.xprv = xprv
    }
}

public struct TSDKParamsOfHDKeyDeriveFromXPrv: Codable {
    /// Serialized extended private key
    public var xprv: String
    /// Child index (see BIP-0032)
    public var child_index: UInt32
    /// Indicates the derivation of hardened/not-hardened key (see BIP-0032)
    public var hardened: Bool

    public init(xprv: String, child_index: UInt32, hardened: Bool) {
        self.xprv = xprv
        self.child_index = child_index
        self.hardened = hardened
    }
}

public struct TSDKResultOfHDKeyDeriveFromXPrv: Codable {
    /// Serialized extended private key
    public var xprv: String

    public init(xprv: String) {
        self.xprv = xprv
    }
}

public struct TSDKParamsOfHDKeyDeriveFromXPrvPath: Codable {
    /// Serialized extended private key
    public var xprv: String
    /// Derivation path, for instance "m/44'/396'/0'/0/0"
    public var path: String

    public init(xprv: String, path: String) {
        self.xprv = xprv
        self.path = path
    }
}

public struct TSDKResultOfHDKeyDeriveFromXPrvPath: Codable {
    /// Derived serialized extended private key
    public var xprv: String

    public init(xprv: String) {
        self.xprv = xprv
    }
}

public struct TSDKParamsOfHDKeySecretFromXPrv: Codable {
    /// Serialized extended private key
    public var xprv: String

    public init(xprv: String) {
        self.xprv = xprv
    }
}

public struct TSDKResultOfHDKeySecretFromXPrv: Codable {
    /// Private key - 64 symbols hex string
    public var secret: String

    public init(secret: String) {
        self.secret = secret
    }
}

public struct TSDKParamsOfHDKeyPublicFromXPrv: Codable {
    /// Serialized extended private key
    public var xprv: String

    public init(xprv: String) {
        self.xprv = xprv
    }
}

public struct TSDKResultOfHDKeyPublicFromXPrv: Codable {
    /// Public key - 64 symbols hex string
    public var `public`: String

    public init(`public`: String) {
        self.`public` = `public`
    }
}

public struct TSDKParamsOfChaCha20: Codable {
    /// Source data to be encrypted or decrypted.
    /// Must be encoded with `base64`.
    public var data: String
    /// 256-bit key.
    /// Must be encoded with `hex`.
    public var key: String
    /// 96-bit nonce.
    /// Must be encoded with `hex`.
    public var nonce: String

    public init(data: String, key: String, nonce: String) {
        self.data = data
        self.key = key
        self.nonce = nonce
    }
}

public struct TSDKResultOfChaCha20: Codable {
    /// Encrypted/decrypted data.
    /// Encoded with `base64`.
    public var data: String

    public init(data: String) {
        self.data = data
    }
}

public struct TSDKRegisteredSigningBox: Codable {
    /// Handle of the signing box.
    public var handle: TSDKSigningBoxHandle

    public init(handle: TSDKSigningBoxHandle) {
        self.handle = handle
    }
}

public struct TSDKParamsOfAppSigningBox: Codable {
    public var type: TSDKParamsOfAppSigningBoxEnumTypes
    /// Data to sign encoded as base64
    public var unsigned: String?

    public init(type: TSDKParamsOfAppSigningBoxEnumTypes, unsigned: String? = nil) {
        self.type = type
        self.unsigned = unsigned
    }
}

/// Signing box callbacks.
public struct TSDKResultOfAppSigningBox: Codable {
    public var type: TSDKResultOfAppSigningBoxEnumTypes
    /// Signing box public key
    public var public_key: String?
    /// Data signature encoded as hex
    public var signature: String?

    public init(type: TSDKResultOfAppSigningBoxEnumTypes, public_key: String? = nil, signature: String? = nil) {
        self.type = type
        self.public_key = public_key
        self.signature = signature
    }
}

/// Returning values from signing box callbacks.
public struct TSDKResultOfSigningBoxGetPublicKey: Codable {
    /// Public key of signing box.
    /// Encoded with hex
    public var pubkey: String

    public init(pubkey: String) {
        self.pubkey = pubkey
    }
}

public struct TSDKParamsOfSigningBoxSign: Codable {
    /// Signing Box handle.
    public var signing_box: TSDKSigningBoxHandle
    /// Unsigned user data.
    /// Must be encoded with `base64`.
    public var unsigned: String

    public init(signing_box: TSDKSigningBoxHandle, unsigned: String) {
        self.signing_box = signing_box
        self.unsigned = unsigned
    }
}

public struct TSDKResultOfSigningBoxSign: Codable {
    /// Data signature.
    /// Encoded with `hex`.
    public var signature: String

    public init(signature: String) {
        self.signature = signature
    }
}

public struct TSDKRegisteredEncryptionBox: Codable {
    /// Handle of the encryption box
    public var handle: TSDKEncryptionBoxHandle

    public init(handle: TSDKEncryptionBoxHandle) {
        self.handle = handle
    }
}

public struct TSDKParamsOfAppEncryptionBox: Codable {
    public var type: TSDKParamsOfAppEncryptionBoxEnumTypes
    /// Data, encoded in Base64
    public var data: String?

    public init(type: TSDKParamsOfAppEncryptionBoxEnumTypes, data: String? = nil) {
        self.type = type
        self.data = data
    }
}

/// Encryption box callbacks.
public struct TSDKResultOfAppEncryptionBox: Codable {
    public var type: TSDKResultOfAppEncryptionBoxEnumTypes
    public var info: TSDKEncryptionBoxInfo?
    /// Encrypted data, encoded in Base64
    public var data: String?

    public init(type: TSDKResultOfAppEncryptionBoxEnumTypes, info: TSDKEncryptionBoxInfo? = nil, data: String? = nil) {
        self.type = type
        self.info = info
        self.data = data
    }
}

/// Returning values from signing box callbacks.
public struct TSDKParamsOfEncryptionBoxGetInfo: Codable {
    /// Encryption box handle
    public var encryption_box: TSDKEncryptionBoxHandle

    public init(encryption_box: TSDKEncryptionBoxHandle) {
        self.encryption_box = encryption_box
    }
}

public struct TSDKResultOfEncryptionBoxGetInfo: Codable {
    /// Encryption box information
    public var info: TSDKEncryptionBoxInfo

    public init(info: TSDKEncryptionBoxInfo) {
        self.info = info
    }
}

public struct TSDKParamsOfEncryptionBoxEncrypt: Codable {
    /// Encryption box handle
    public var encryption_box: TSDKEncryptionBoxHandle
    /// Data to be encrypted, encoded in Base64
    public var data: String

    public init(encryption_box: TSDKEncryptionBoxHandle, data: String) {
        self.encryption_box = encryption_box
        self.data = data
    }
}

public struct TSDKResultOfEncryptionBoxEncrypt: Codable {
    /// Encrypted data, encoded in Base64
    public var data: String

    public init(data: String) {
        self.data = data
    }
}

public struct TSDKParamsOfEncryptionBoxDecrypt: Codable {
    /// Encryption box handle
    public var encryption_box: TSDKEncryptionBoxHandle
    /// Data to be decrypted, encoded in Base64
    public var data: String

    public init(encryption_box: TSDKEncryptionBoxHandle, data: String) {
        self.encryption_box = encryption_box
        self.data = data
    }
}

public struct TSDKResultOfEncryptionBoxDecrypt: Codable {
    /// Decrypted data, encoded in Base64
    public var data: String

    public init(data: String) {
        self.data = data
    }
}

