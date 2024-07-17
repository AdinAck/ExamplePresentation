//
//  Videos.swift
//  ExamplePresentation
//
//  Created by Adin Ackerman on 7/20/23.
//

import Foundation
import SwiftUI
import PresentationKit
import AVKit

class Videos: SlideModel {
    let name: String = "Videos"
    let duration: CGFloat = 3
    let transition: PresentationKit.Transition = .fade
    var teleprompt: [String]? = [
        "The timeline controls are always present at the bottom."
    ]
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            VideosView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct VideosView: SlideView {
    @EnvironmentObject var model: Videos
    
    var t: CGFloat
    var scale: CGFloat
    
    @State var player: AVPlayer!
    
    var body: some View {
        ZStack {
            if let player {
                AVPlayerControllerRepresented(player: player)
            } else {
                Text("\\(O_o)/")
                    .foregroundColor(.black)
            }
            
            if t > 0 {
                VStack {
                    Text("Videos are just like any other item")
                    
                    if t > 1 {
                        Text("This video repeats forever")
                    }
                }
                    .font(.system(size: 100 * scale))
                    .foregroundColor(.white)
                    .padding(32 * scale)
                    .background(
                        RoundedRectangle(cornerRadius: 32 * scale)
                            .fill(.ultraThinMaterial)
                    )
            }
        }
        .onAppear {
            player = AVPlayer(url: createLocalUrl(for: "Demo", ofType: "mp4")!)
            player.play()
            
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player.currentItem, queue: .main) { _ in
                self.player.seek(to: .zero)
                self.player.play()
            }
        }
        .onChange(of: t) { _, newValue in
            if let player {
                if newValue == 0 {
                    player.seek(to: .zero)
                    player.play()
                }
            }
        }
    }
}
