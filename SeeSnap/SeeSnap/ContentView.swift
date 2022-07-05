//
//  ContentView.swift
//  SeeSnap
//
//  Created by Abhirath Sujith on 05/07/22.
//

import SwiftUI


struct Snap: Identifiable {
    var id: String { title }
    let title: String
    let rating: Int
    let imgString: String
    var bgString: String?
    
    static let photos = [
    Snap(title: "A", rating: 5, imgString: "1"),
    Snap(title: "B", rating: 5, imgString: "2"),
    Snap(title: "C", rating: 5, imgString: "3"),
    Snap(title: "D", rating: 5, imgString: "4"),
    Snap(title: "E", rating: 5, imgString: "5"),
    Snap(title: "F", rating: 5, imgString: "6"),
    Snap(title: "H", rating: 5, imgString: "7"),
    Snap(title: "I", rating: 5, imgString: "8"),
    Snap(title: "L", rating: 5, imgString: "9"),
    Snap(title: "K", rating: 5, imgString: "10"),
    ]
}

struct ContentView: View {
    
    let snaps = Snap.photos
    
    var body: some View {
        GeometryReader { reader in
            let screenSize = reader.size
            ZStack {
                let itemWidth: CGFloat = screenSize.width * 0.8
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(snaps) { snap in
                            SnapItem(snap: snap, screenSize: screenSize, width: itemWidth)
                         
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.cyan)
        }
    }
}
   
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
