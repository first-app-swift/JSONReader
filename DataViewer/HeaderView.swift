//
//  HeaderView.swift
//  DataViewer
//
//  Created by Amey Ranade on 21/04/21.
//

import SwiftUI

struct HeaderView: View {
    let symbolSystemName : String
    let headerText : String
    var body: some View {
        
        HStack {
            Image(systemName : symbolSystemName)
            Text(headerText) }.font(.title3)
            .foregroundColor(.red)
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(symbolSystemName: "", headerText: "" )
    }
}
