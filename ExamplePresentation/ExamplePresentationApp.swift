//
//  ExamplePresentationApp.swift
//  ExamplePresentation
//
//  Created by Adin Ackerman on 7/20/23.
//

import SwiftUI
import PresentationKit

@main
struct ExamplePresentationApp: App {
    @StateObject var model = Presentation(bgColor: .white, slides: [
        Title(),
        MultiFrame(),
        Videos(),
        End()
    ])
    
    var body: some Scene {
        WindowGroup {
            PresentationView()
                .environmentObject(model)
        }
        .commands {
            CommandMenu("Control") {
                Text("Current frame: \(Int(model.keyframe))")
                
                Button("Next Keyframe") {
                    model.nextKeyframe()
                }
                .keyboardShortcut("N")
                
                Button("Previous Keyframe") {
                    model.prevKeyFrame()
                }
                .keyboardShortcut("B")
            }
        }
    }
}
