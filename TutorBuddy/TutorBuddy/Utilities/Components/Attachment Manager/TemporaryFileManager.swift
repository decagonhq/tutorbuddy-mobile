//
//  TemporaryFileManager.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 06/04/2022.
//

import Foundation

final class TemporaryFileManager {
    
    var fileManager = FileManager.default
    var tempFileUrl: URL?
    var tempFolder: URL?
    
    func createTempFile(_ imageData: Data) {
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        tempFolder = url.appendingPathComponent("ac_temp")
        guard let tempFolder = self.tempFolder else { return }
        do {
            try fileManager.createDirectory(at: tempFolder, withIntermediateDirectories: true, attributes: [:])
            tempFileUrl = tempFolder.appendingPathComponent("captured_file_\(Date().appendAsString()).jpeg")
            guard let tempFileUrl = self.tempFileUrl else { return }
            fileManager.createFile(atPath: tempFileUrl.path, contents: imageData, attributes: [FileAttributeKey.creationDate: Date()])
            
        } catch {
            print(error)
        }
    }
    
    func createTemporaryFileURL(for imageData: Data) -> URL? {
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        tempFolder = url.appendingPathComponent("ac_temp")
        guard let tempFolder = self.tempFolder else { return nil }
        do {
            try fileManager.createDirectory(at: tempFolder, withIntermediateDirectories: true, attributes: [:])
            tempFileUrl = tempFolder.appendingPathComponent("captured_file_\(Date().appendAsString()).jpeg")
            guard let tempFileUrl = self.tempFileUrl else { return nil }
            fileManager.createFile(atPath: tempFileUrl.path, contents: imageData, attributes: [FileAttributeKey.creationDate: Date()])
            if fileManager.fileExists(atPath: tempFileUrl.path) {
                return tempFileUrl
            }
        } catch {
            return nil
        }
        return nil
    }
    
    func retriveTempFilePath() -> URL? {
        if let tempFileUrl = self.tempFileUrl {
            if fileManager.fileExists(atPath: tempFileUrl.path) {
                return tempFileUrl
            }
        }
        return URL(string: "")
    }
    
    func clearTempFile() {
        guard let tempFolder = self.tempFolder else { return }
        if fileManager.fileExists(atPath: tempFolder.path) {
            do {
                try fileManager.removeItem(at: tempFolder)
                guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
                    return
                }
            } catch {
                print(error)
            }
        }
    }
}
