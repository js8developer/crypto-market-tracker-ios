//
//  URLImageView.swift
//  NFTCollectionUI
//
//  Created by Jason Schneider on 7/11/22.
//

import SwiftUI

struct URLImageView: View {
    
    var urlString: String
    var width: CGFloat = 100
    var height: CGFloat = 100
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: width, height: height)
                                .background(Color.gray.opacity(0.5))
                            
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                                 .frame(width: width, height: height)
                        case .failure:
                            Image(systemName: "photo")
                                .frame(width: width, height: height)
                        @unknown default:
                            // Since the AsyncImagePhase enum isn't frozen,
                            // we need to add this currently unused fallback
                            // to handle any new cases that might be added
                            // in the future:
                            EmptyView()
                        
                        }
                    }
    }
}
