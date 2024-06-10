//
//  File.swift
//  IFoodQuality
//
//  Created by amine maza on 20/04/2024.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    var uri: String?
    @Published var image: UIImage?
    
    func loadImage() {
        Task {
            if let uri = uri {
                let data = try? await FirestoreService.downloadFile(filepath: uri)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }
    }
}

