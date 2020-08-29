//
//  ContentView.swift
//  COVID Likelihood
//
//  Created by Kenneth Yamashita on 8/28/20.
//  Copyright © 2020 Kenneth Yamashita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            //GeometryReader{geo in
            ZStack{
                Image("BCKGRD1").resizable().edgesIgnoringSafeArea(.all)
                Text("COVID-19 LIKELIHOOD ").bold().font(.custom("STHeitiSC-Medium", size: 45)).multilineTextAlignment(.center).position(x: 200, y: 140)
                NavigationLink(destination: QuestionsView()) {
                    Text("START").bold().foregroundColor(.white).font(.system(size: 30))
                }.position(x: 190, y: 530)
                NavigationLink(destination: InfoView()) {
                    Text("INFO").bold().foregroundColor(.white).font(.system(size: 30))
                }.position(x: 190, y: 470)
            }.navigationBarTitle(Text("Home"),displayMode: .inline)
                
            //}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
