//
//  SortCapsule.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import SwiftUI


struct SortCapsule: View {
    
    var tag: SortTag
    @Binding var index: Int
    
    var bgColor: Color {
        return ((index == tag.index) ? Color.blue : Color.gray.opacity(0.2))
    }
    var textColor: Color {
        return (index == tag.index) ? Color.white : Color.primary
    }
    
    var body: some View {
        
        Text(tag.text)
            .font(.system(size: 16, weight: .semibold))
            .padding()
            .background(bgColor)
            .foregroundColor(textColor)
            .clipShape(Capsule())
    }
}
