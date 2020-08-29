//
//  StartButtonView.swift
//  COVID Likelihood
//
//  Created by Kenneth Yamashita on 8/28/20.
//  Copyright © 2020 Kenneth Yamashita. All rights reserved.
//

import SwiftUI

struct StartButtonView: View {
    var text:String
    var body: some View {
        ZStack{
            Rectangle().size(width: 120, height: 80).foregroundColor(Color.green.opacity(0.2)).cornerRadius(30)
            Text("\(text)").bold()
        }
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(text: "START")
    }
}
