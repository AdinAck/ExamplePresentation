//
//  Title.swift
//  ExamplePresentation
//
//  Created by Adin Ackerman on 7/20/23.
//

import Foundation
import SwiftUI
import PresentationKit

class Title: SlideModel {
    let name: String = "Title"
    let duration: CGFloat = 2
    let transition: Transition = .slide
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            TitleView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct TitleView: SlideView {
    @EnvironmentObject var model: Title
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("PresentationKit")
                    .font(.system(size: 500 * scale))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .offset(y: t >= 1 ? 0 : 100 * scale)
                    .opacity(t >= 1 ? 1 : 0)
                    .animation(Presentation.animation, value: t)
                
                Text("Stunning presentations")
                    .font(.system(size: 150 * scale))
                    .fontWeight(.medium)
                    .foregroundColor(.black.opacity(0.5))
                    .offset(y: t >= 1 ? 0 : 100 * scale)
                    .opacity(t >= 1 ? 1 : 0)
                    .animation(Presentation.animation.delay(0.1), value: t)
                
                Text("Adin Ackerman")
                    .font(.system(size: 100 * scale))
                    .fontWeight(.thin)
                    .italic()
                    .foregroundColor(.black)
                    .offset(y: t >= 1 ? 0 : 100 * scale)
                    .opacity(t >= 1 ? 1 : 0)
                    .animation(Presentation.animation.delay(0.2), value: t)
            }
        }
    }
}
