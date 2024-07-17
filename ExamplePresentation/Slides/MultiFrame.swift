//
//  MultiFrame.swift
//  ExamplePresentation
//
//  Created by Adin Ackerman on 7/20/23.
//

import Foundation
import SwiftUI
import PresentationKit

class MultiFrame: SlideModel {
    let name: String = "Multiple Frames"
    let duration: CGFloat = 4
    let transition: PresentationKit.Transition = .slide
    var teleprompt: [String]? = [
        "This is the teleprompter.",
        "You can use it to display notes for the current slide."
    ]
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            MultiFrameView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct MultiFrameView: SlideView {
    @EnvironmentObject var model: MultiFrame
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        VStack {
            if (2...3).contains(t) {
                Text("Where items **appear**")
                    .fontDesign(.monospaced)
                    .foregroundColor(.black)
                    .font(.system(size: 150 * scale))
            }
            
            HStack {
                if t < 3 {
                    Text("Slides can have")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: 100 * scale))
                }
                
                if (1...2).contains(t) {
                    Text("multiple frames")
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .font(.system(size: 100 * scale))
                }
            }
            
            if (3...3).contains(t) {
                Text("and disappear")
                    .fontDesign(.serif)
                    .foregroundColor(.black)
                    .font(.system(size: 150 * scale))
            }
        }
    }
}
