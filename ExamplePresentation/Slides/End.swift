//
//  End.swift
//  ExamplePresentation
//
//  Created by Adin Ackerman on 7/20/23.
//

import Foundation
import SwiftUI
import PresentationKit

class End: SlideModel {
    let name: String = "End"
    let duration: CGFloat = 1
    let transition: PresentationKit.Transition = .slide
    var teleprompt: [String]? = nil
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            EndView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct EndView: SlideView {
    @EnvironmentObject var model: End
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        Text("That's it!")
            .font(.system(size: 500 * scale))
            .fontWeight(.bold)
            .foregroundColor(.black)
    }
}
