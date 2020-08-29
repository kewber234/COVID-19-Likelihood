//
//  CheckBoxView.swift
//  COVID Likelihood
//
//  Created by Kenneth Yamashita on 8/28/20.
//  Copyright © 2020 Kenneth Yamashita. All rights reserved.
//

import SwiftUI

struct CheckBoxView: View {
    var text:String
    @Binding var active:Bool
    var body: some View {
        HStack{
            Spacer()
            if text != "Check all symptoms you are experiencing:"{
            Rectangle().size(width: 25,height: 25).frame(width:25,height: 25).foregroundColor(active ? Color.yellow : Color.white).onTapGesture {
                self.active.toggle()
            }
            }
            /*Spacer()
            if text=="Check all symptoms you are experiencing"{
            Text("\(text)").font(.system(size: text=="Check all symptoms you are experiencing" ? 20 : 30))
            }*/
            Spacer()
            Spacer()
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(text: "Cough", active: Binding.constant(true))
    }
}
