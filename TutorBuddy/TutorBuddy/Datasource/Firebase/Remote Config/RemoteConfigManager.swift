//
//  RemoteConfigManager.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 22/04/2022.
//

import Foundation
import FirebaseRemoteConfig

struct RemoteConfigManager: Scopable {
    
    fileprivate let remoteConfig = RemoteConfig.remoteConfig()
    fileprivate let decoder = JSONDecoder()
    static let shared = RemoteConfigManager()
    
    fileprivate init(){}
    
    fileprivate func key(for key: RemoteConfigKey) -> String { key.rawValue }
    
    fileprivate func configValue(for key: String) -> RemoteConfigValue { remoteConfig.configValue(forKey: key) }
    
    func value<T: Codable>(for: T.Type, key: RemoteConfigKey) -> T? {
        try? decoder.decode(T.self, from: configValue(for: key.rawValue).dataValue)
    }
    
    func string(for configKey: RemoteConfigKey) -> String? {
        configValue(for: key(for: configKey)).stringValue
    }
    
}
