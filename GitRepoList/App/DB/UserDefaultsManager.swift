//
//  UserDefaultsManager.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

struct UserDefaultsManager {
    static func uniqueKey<T>(of type: T.Type, for key: String) -> String {
        String(describing: type) + key
    }
    
    static func set(_ array: [Any], forKey key: String) {
        userDefaults.set(array, forKey: key)
    }
    
    static func set(_ bool: Bool, forKey key: String) {
        userDefaults.set(bool, forKey: key)
    }
    
    static func set(_ data: Data, forKey key: String) {
        userDefaults.set(data, forKey: key)
    }
    
    static func set<T>(_ dictionary: [T: Any], forKey key: String) {
        userDefaults.set(dictionary, forKey: key)
    }
    
    static func set(_ double: Double, forKey key: String) {
        userDefaults.set(double, forKey: key)
    }
    
    static func set(_ float: Float, forKey key: String) {
        userDefaults.set(float, forKey: key)
    }
    
    static func set(_ integer: Int, forKey key: String) {
        userDefaults.set(integer, forKey: key)
    }
    
    static func set(_ string: String, forKey key: String) {
        userDefaults.set(string, forKey: key)
    }
    
    static func set(_ stringArray: [String], forKey key: String) {
        userDefaults.set(stringArray, forKey: key)
    }
    
    static func set(_ url: [URL], forKey key: String) {
        userDefaults.set(url, forKey: key)
    }
    
    static func array<T>(_ type: T.Type, forKey key: String) -> [T] {
        (userDefaults.array(forKey: key) as? [T]) ?? []
    }
    
    static func bool(forKey key: String) -> Bool {
        userDefaults.bool(forKey: key)
    }
    
    static func data(forKey key: String) -> Data? {
        userDefaults.data(forKey: key)
    }
    
    static func dictionary<T, U>(_ keyType: T.Type, _ valueTYpe: U.Type, forKey key: String) -> [T: U] {
        (userDefaults.dictionary(forKey: key) as? [T: U]) ?? [T: U]()
    }
    
    static func double(forKey key: String) -> Double {
        userDefaults.double(forKey: key)
    }
    
    static func float(forKey key: String) -> Float {
        userDefaults.float(forKey: key)
    }
    
    static func integer(forKey key: String) -> Int {
        userDefaults.integer(forKey: key)
    }
    
    static func object<T>(_ type: T.Type, forKey key: String) -> T? {
        userDefaults.object(forKey: key) as? T
    }
    
    static func string(forKey key: String) -> String? {
        userDefaults.string(forKey: key)
    }
    
    static func stringArray(forKey key: String) -> [String] {
        userDefaults.stringArray(forKey: key) ?? []
    }
    
    static func url(forKey key: String) -> URL? {
        userDefaults.url(forKey: key)
    }
    
    static func archive<T>(_ object: T, forKey key: String) where T: Encodable {
        guard let data = try? JSONEncoder().encode(object) else {
            return
        }
        
        userDefaults.set(data, forKey: key)
    }
    
    static func unarchive<T>(_ type: T.Type, forKey key: String) -> T? where T: Decodable {
        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    private static var userDefaults = UserDefaults.standard
    
    private init() {
    }
}
