//
//  MarketSortGroup.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import SwiftUI


struct MarketSortGroup_Previews: PreviewProvider {
    static var previews: some View {
        MarketSortGroup(manager: MarketManager())
    }
}


struct MarketSortGroup: View {
    
    @ObservedObject var manager: MarketManager
    
    @State var tags: [SortTag] = []
    @State var index: Int = 0
    
    
    func makeTags() -> [SortTag]{
        let tags = ["Rank", "Name", "Symbol", "Price"]
        var index = 0
        var sortTags: [SortTag] = []
        
        for tag in tags {
            let newTag = SortTag(index: index, text: tag)
            sortTags.append(newTag)
            index += 1
        }
        
        return sortTags
    }
    
    
    func handleAction(){
        if index == 0 { manager.sortBy_rank() }
        else if index == 1 { manager.sortBy_name() }
        else if index == 2 { manager.sortBy_symbol() }
        else if index == 3 { manager.sortBy_price() }
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Sort by")
                .font(.system(size: 17, weight: .semibold))
            
            HStack(alignment: .firstTextBaseline) {
                ForEach(makeTags()){ (tag) in
                    Button(action: {
                        index = tag.index
                        handleAction()
                    }){
                        SortCapsule(tag: tag, index: $index)
                    }
                }
                Spacer()
            }
        }
            
        
        
        
        .onAppear {
            tags = makeTags()
        }
        
    }
}


