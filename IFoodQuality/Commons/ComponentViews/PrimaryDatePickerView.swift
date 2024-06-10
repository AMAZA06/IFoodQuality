//
//  PrimaryDatePickerView.swift
//  IFoodQuality
//
//  Created by amine maza on 04/05/2024.
//

import SwiftUI

struct PrimaryDatePickerView: View {
    
    var height: CGFloat = 55
    var width: CGFloat = UIScreen.main.bounds.width * 0.8
    var label: LocalizedStringKey = "Pick a date"
    @Binding var date: Date
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.datepicker)
            .overlay {
                DatePicker(
                    label,
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.compact)
                .padding(10.0)
            }.frame(width: width, height: height)
    }
}

#Preview {
    PrimaryDatePickerView(date: .constant(Date()))
}
