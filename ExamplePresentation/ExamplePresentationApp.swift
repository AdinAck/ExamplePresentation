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
    @StateObject var presentation = Presentation(bgColor: .white, slides: [
        Title(),
        MultiFrame(),
        Videos(),
        End()
    ])
    
    var body: some Scene {
        PresentationScene(presentation: presentation)
    }
}
