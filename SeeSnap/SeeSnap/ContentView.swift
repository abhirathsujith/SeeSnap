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
    Snap(title: "Sunset", rating: 5, imgString: "1"),
    Snap(title: "Sunset", rating: 5, imgString: "2"),
    Snap(title: "Sunset", rating: 5, imgString: "3"),
    Snap(title: "Sunset", rating: 5, imgString: "4"),
    Snap(title: "Sunset", rating: 5, imgString: "5"),
    Snap(title: "Sunset", rating: 5, imgString: "6"),
    Snap(title: "Sunset", rating: 5, imgString: "7"),
    Snap(title: "Sunset", rating: 5, imgString: "8"),
    Snap(title: "Sunset", rating: 5, imgString: "9"),
    Snap(title: "Sunset", rating: 5, imgString: "10"),
    ]
}

struct ContentView: View {
    
    let snaps = Snap.photos
    
    var body: some View {
        GeometryReader { reader in
            let screenSize = reader.size
            ZStack {
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(snaps) { snap in
                            Image(snap.imgString)
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenSize.width, height: screenSize.height)
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
