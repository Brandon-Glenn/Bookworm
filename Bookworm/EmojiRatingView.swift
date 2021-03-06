//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Brandon Glenn on 1/4/22.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    
    var body: some View {
        switch rating {
        case 1:
            return Text("๐ก")
        case 2:
            return Text("๐")
        case 3:
            return Text("๐คจ")
        case 4:
            return Text("๐ค")
        case 5:
            return Text("๐คฉ")
        default:
            return Text("")
        }
        
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
