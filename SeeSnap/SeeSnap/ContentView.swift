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
    
    @State private var offsetX: CGFloat = 0
    @State private var maxOffsetX: CGFloat = -1
    
    var body: some View {
        GeometryReader { reader in
            let screenSize = reader.size
            ZStack {
                backgroundCarousel(screenSize: screenSize)
                snapsCarousel(reader: reader)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
          
        }
    }
    
    func backgroundCarousel(screenSize: CGSize) -> some View {
        let bgWidth: CGFloat = screenSize.width * CGFloat(snaps.count)
        let scrollPercentage = offsetX / maxOffsetX
        let clampedPercentage: CGFloat = 1 - max(0, min(scrollPercentage, 1))
        let posX: CGFloat = (bgWidth - screenSize.width) * clampedPercentage
        
        return HStack(spacing: 0){
            ForEach(snaps.reversed()) { snap in
                Image(snap.bgString ?? snap.imgString)
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenSize.width)
                    .frame(maxHeight: .infinity)
                    .blur(radius: 1)
                    .scaleEffect(1)
                    .clipped()
                    .overlay(Color.black.opacity(0.7))
                    .ignoresSafeArea()
                
            }
        }
        
        .frame(width: bgWidth)
        .position(x: bgWidth / 2 - posX, y: screenSize.height / 2)
        
        
    }
    
    func snapsCarousel(reader: GeometryProxy) -> some View {
        let screenSize = reader.size
        let itemWidth: CGFloat = screenSize.width * 0.8
        let paddingX: CGFloat = (screenSize.width - itemWidth) / 2
        let spacing: CGFloat = 12
        return  ScrollView(.horizontal) {
            HStack(spacing: 0){
                
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        offsetX = (geo.frame(in: .global).minX - paddingX) * -1
                        let scrollContentWidth = itemWidth * CGFloat(snaps.count) + spacing * CGFloat(snaps.count - 1)
                        let maxOffsetX = scrollContentWidth + 2 * paddingX - screenSize.width
                        if self.maxOffsetX == -1 {
                            self.maxOffsetX = maxOffsetX
                        }
                      //  print(offsetX / maxOffsetX )
                    }
                    return Color.clear
                }
                
                
                HStack(spacing: spacing){
                    ForEach(snaps) { snap in
                        SnapItem(snap: snap, screenSize: screenSize, width: itemWidth)
                    }
                }
                
            }
            
            .padding(.horizontal, paddingX)
            
        }
        
    }
}
   
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
