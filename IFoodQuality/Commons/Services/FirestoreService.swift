//
//  FirestoreService.swift
//  IFoodQuality
//
//  Created by amine maza on 20/04/2024.
//

import Foundation
import FirebaseStorage
import UIKit
struct FirestoreService {
    
    static func uploadFile(data: Data?, filename: String) async throws -> String? {
        guard let imageData = data else {
            return nil
        }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let storageRef = Storage.storage().reference().child(filename)
        
        guard let jpegData = data else {
            return nil
        }
        do {
        
            let upload = try await storageRef.putDataAsync(jpegData, metadata: metadata)
            return  storageRef.fullPath
        } catch {
            throw error
        }
    }
    
    static func downloadFile(filepath: String) async throws -> Data {
        let storageReference = Storage.storage().reference(withPath: filepath)
        
        return try await withCheckedThrowingContinuation { continuation in
            storageReference.getData(maxSize: 10 * 1024 * 1024) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data {
                    continuation.resume(returning: data)
                } else {
                    continuation.resume(throwing: NSError(domain: "DownloadError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"]))
                }
            }
        }
    }
}
