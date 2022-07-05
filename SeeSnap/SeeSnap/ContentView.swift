//
//  ContentView.swift
//  SeeSnap
//
//  Created by Abhirath Sujith on 05/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(0..<10) { i in
                            Rectangle()
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
