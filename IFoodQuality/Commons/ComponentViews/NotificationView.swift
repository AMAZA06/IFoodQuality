//
//  NotificationView.swift
//  IFoodQuality
//
//  Created by amine maza on 29/04/2024.
//

import SwiftUI

struct NotificationView: View {
    
    @State private var isShowing = false
    
    var type: NotificationType
    let message: LocalizedStringKey
    var color: Color {
        get  {
            if (type == .SUCCESS) {
                return Color(.green)
            } else if (type == .FAILURE) {
                return Color(.red)
            } else if (type == .INFORMATION) {
                return Color(.white)
            }
            return Color(.white)
        }
    }
    
    var body: some View {
        ZStack {
            if isShowing {
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(color)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                    .overlay(
                        HStack {
                            Text(message)
                                .foregroundColor(.black)
                                .padding(.leading, 5)
                            Spacer()
                        }
                    )
                    .padding(.top, 30)
                    .transition(.scale)
                    .animation(.easeInOut, value: 2.0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                isShowing = false
                            }
                        }
                    }
            }
        }
        .onAppear {
            withAnimation {
                isShowing = true
            }
        }
    }
}

#Preview {
    NotificationView(type: NotificationType.SUCCESS, message: "Notification sur deux lignes - notification de test")
}
