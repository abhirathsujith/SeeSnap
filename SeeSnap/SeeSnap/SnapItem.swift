//
//  SnapItem.swift
//  SeeSnap
//
//  Created by Abhirath Sujith on 05/07/22.
//

import SwiftUI

struct SnapItem: View {
    
    let snap: Snap
    let screenSize: CGSize
    
    let width: CGFloat
    
    var body: some View {
        Image(snap.imgString)
            .resizable()
            .scaledToFit()
            .frame(width: screenSize.width, height: screenSize.height)
    }
}

struct SnapItem_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
