//
//  UserPictureView.swift
//  IFoodQuality
//
//  Created by amine maza on 31/03/2024.
//

import SwiftUI
import PhotosUI

struct PictureView: View {
    
    var defaultPicture = Image(systemName: "photo")
    @State var picturePicked: PhotosPickerItem?
    @Binding var dataPicture: Data?
    
    var body: some View {
        ZStack {
            
            if let dataPicture = dataPicture, let uiImage = UIImage(data: dataPicture) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } else {
                defaultPicture
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.picture)
            }
            
            PhotosPicker(selection: $picturePicked, matching: .images) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }.task(id: picturePicked) {
                dataPicture = try? await picturePicked?.loadTransferable(type: Data.self)
            }
            .background(
                Circle().foregroundColor(.primaryButton)
                    .frame(width: 30, height: 30)
            )
            .padding([.top, .leading], 70)
        }
    }
}

#Preview {
    PictureView(dataPicture: .constant(nil))
}
