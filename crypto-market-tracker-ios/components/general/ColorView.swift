//
//  ColorView.swift
//  NFTCollectionUI
//
//  Created by Jason Schneider on 7/11/22.
//

import SwiftUI


struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}

let colors: [Color] = [.red, .green, .blue, .yellow, .purple]

@ViewBuilder
func ColorView() -> some View {
   (colors.randomElement() ?? .gray)
       .cornerRadius(10)
       .frame(minHeight: 40)
}
