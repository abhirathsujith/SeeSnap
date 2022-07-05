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
        
        GeometryReader { reader in
            
            let midX = reader.frame(in: .global).midX
            let distance = abs(screenSize.width / 2 - midX )
            let damping: CGFloat = 1
            let percentage = abs(distance / (screenSize.width / 1.5) / damping - 1 )
            VStack {
                Image(snap.imgString)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenSize.width, height: screenSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: .black.opacity(0.6), radius: 14, y: 10)
                
                Text(snap.title)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                HStack(spacing: 5){
                    ForEach(1..<6) { i in
                        Image(systemName: i <= snap.rating ? "star.fill" : "star")
                            .font(.system(size: 20))
                            .foregroundColor(.yellow)
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .scaleEffect(percentage)
           
            
        }
        .frame(width: width )
        .frame(maxHeight: .infinity)
       
    }
}

struct SnapItem_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
