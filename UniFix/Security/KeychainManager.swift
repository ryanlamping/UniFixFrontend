//
//  KeychainManager.swift
//  UniFix
//
//  Created by Ryan Lamping on 11/24/24.
//

import Foundation
import Security

final class KeychainManager {
    // Setting instance of the key chain
    static let instance = KeychainManager()
    private init() {}
    
    
    enum KeychainError: Error {
        case duplicateEntry
        case unknown(OSStatus)
    }
    
    // Saving the token to use after authentication
    func saveToken(_ token: String, forKey key: String) throws {
        if let data = token.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data,
                kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
            ]
            
            // Adding query into keychain
            let status = SecItemAdd(query as CFDictionary, nil)
            
            guard status != errSecDuplicateItem else {
                print("status equals error of duplicate entry")
                throw KeychainError.duplicateEntry
            }
            
            guard status == errSecSuccess else {
                print("unkown error")
                throw KeychainError.unknown(status)
            }
        }
    }
    
    // Retrieve token
    // Key used to retrieve token
    func getToken(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        // Storing the retrived data
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess, let data = dataTypeRef as? Data {
             return String(data: data, encoding: .utf8)
        }

        return nil
    }
}
