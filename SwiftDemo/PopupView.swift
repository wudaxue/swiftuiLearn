//
//  PopupView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct PopupView: View {
    @State private var showPopup = false // Controls if the popup shows or not
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Show Popup")
                BannerText(_text: "The popup will also be another ZStack because we want a dark transparent background to it.", backColor:.yellow)
                Spacer()
                Button("Show Popup") {
                    // Show popup
                    showPopup = true
                }
            }
            .font(.title)
            // Blur the background when popup is showing
            .blur(radius: showPopup ? 2 : 0)
            
            if showPopup {
                //The popup
                ZStack {
                    // Background transparent color
                    Color.black
                        .opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture { showPopup = false
                        }
                    VStack(spacing: 20) {
                        Text("Drag popup off the screen")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                        Spacer()
                        Text("You can also tap outside of the popup to close")
                        Spacer()
                        Button("Or Tap This Button to Close") {
                            // Dismiss popup
                            showPopup = false
                        }
                        .padding(.bottom)
                    }
                    .frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(.horizontal, 25)
                }
            }
        }
    }
}

#Preview {
    PopupView()
}
