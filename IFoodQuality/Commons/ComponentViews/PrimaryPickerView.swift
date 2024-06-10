//
//  PrimaryPickerView.swift
//  IFoodQuality
//
//  Created by amine maza on 08/05/2024.
//

import SwiftUI

struct PrimaryPickerView<T: Hashable>: View {
    
    var height: CGFloat = 55
    var width: CGFloat = UIScreen.main.bounds.width * 0.8
    
    var label: LocalizedStringKey = "test"
    
    @Binding var field: Int
    var pickerArray : [T]
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(.textField)
            HStack {
                Text(label)
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
                Spacer()
                
                Picker(label, selection: $field) {
                    if let zones = pickerArray as? [ZoneItem] {
                        ForEach(zones, id: \.id) { item in
                            Text(item.name).tag(item.id)
                        }
                    }
                    if let roles = pickerArray as? [Role] {
                        ForEach(roles, id: \.self) { role in
                            Text("\(role)").tag(role.rawValue)
                        }
                    }
                }.accentColor(.white)
                
            }
        }
        .frame(width: width, height: height)
    }
}

//#Preview {
//    PrimaryPickerView(field: .constant(""), pickerArray: ["",""])
//}
