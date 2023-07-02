//
//  StorageCache.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 01/07/23.
//

import Foundation

class StorageCache {

    public enum StorageCacheError: Error {
        case fileNotFound
        case couldNotAccessUserDomain
    }

    init() {}

//    static func save<T: Encodable>(_ value: T, as path: String) throws -> URL {
//        do {
//            let encoder = JSONEncoder()
//            let encodedData = try encoder.encode(value) as Data
//            return try StorageCache.save(encodedData, as: path)
//        } catch {
//            throw error
//        }
//    }
//
//    static func retrieve<T: Decodable>(_ path: String, as type: T.Type) throws -> T {
//        do {
//            let data = try retrieve(path)
//            let decoder = JSONDecoder()
//            let value = try decoder.decode(type, from: data)
//            return value
//        } catch {
//            throw error
//        }
//    }

    static func save(_ value: Data, as path: String) throws -> URL {
        do {
            let url = try createURL(for: path)
            try createFolders(at: url)
            try value.write(to: url, options: .atomic)
            return url
        } catch {
            throw error
        }
    }

    static func retrieve(_ path: String) throws -> Data {
        do {
            let url = try getExistingFileURL(for: path)
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }

    static func remove(_ url: URL) throws {
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            throw error
        }
    }

    static func clear() throws {
        do {
            let url = try createURL(for: nil)
            let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
            for fileUrl in contents {
                try? FileManager.default.removeItem(at: fileUrl)
            }
        } catch {
            throw error
        }
    }
}

extension StorageCache {

    static func getExistingFileURL(for path: String) throws -> URL {
        do {
            let url = try createURL(for: path)
            if FileManager.default.fileExists(atPath: url.path) {
                return url
            }
            throw StorageCacheError.fileNotFound
        } catch {
            throw error
        }
    }

    static func createFolders(at url: URL) throws {
        do {
            let folderUrl = url.deletingLastPathComponent()
            var folderExists = false
            var isDirectory: ObjCBool = false
            if FileManager.default.fileExists(atPath: folderUrl.path, isDirectory: &isDirectory) {
                if isDirectory.boolValue {
                    folderExists = true
                }
            }
            if !folderExists {
                try FileManager.default.createDirectory(at: folderUrl, withIntermediateDirectories: true, attributes: nil)
            }
        } catch {
            throw error
        }
    }

    static func createURL(for path: String?) throws -> URL {
        let filePrefix = "file://"

        if var url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            if let path = path {
                url = url.appendingPathComponent(path + ".json", isDirectory: false)
            }
            if url.absoluteString.lowercased().prefix(filePrefix.count) != filePrefix {
                let fixedUrlString = filePrefix + url.absoluteString
                url = URL(string: fixedUrlString)!
            }
            return url
        } else {
            throw StorageCacheError.couldNotAccessUserDomain
        }
    }
}
