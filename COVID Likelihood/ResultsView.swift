//
//  ResultsView.swift
//  COVID Likelihood
//
//  Created by Kenneth Yamashita on 8/28/20.
//  Copyright © 2020 Kenneth Yamashita. All rights reserved.
//

import SwiftUI

struct ResultsView: View {
    @Binding var percentage:Int
    @Binding var weightAvg:Double
    @State private var text = ""
    var body: some View {
        ZStack{
            Image("BCKGRD4").resizable().edgesIgnoringSafeArea(.all)
        VStack{
            
            Text("Risk Points").font(.custom("STHeitiSC-Medium", size: 50)).shadow(radius: 2,x:4,y:4)
            Text("\(Int(Double(percentage)*weightAvg))/1414").font(.custom("STHeitiSC-Medium", size: 55)).shadow(radius: 2,x:5,y:5)
            
            VStack(spacing: 40){
                Text("\(getText())").multilineTextAlignment(.center).offset(y:30).font(.custom("STHeitiSC-Medium", size: 20)).padding(.horizontal,12)
                //Text("")
                Text("WHAT TO DO NEXT").font(.custom("STHeitiSC-Medium", size: 25)).offset(y:30)
                //Text("")
                Text("\(getText2())").font(.custom("STHeitiSC-Medium", size: 20)).padding()
            }
            
            }.shadow(radius: 2,x:2,y:2)
        }
    }
    func getText()->String{
        if Double(percentage)*weightAvg >= 600{
            return "You have a very likely chance of having COVID-19."
        }
        else if Double(percentage)*weightAvg >= 400{
            return "You likely have COVID-19."
        }
        else if Double(percentage)*weightAvg >= 200{
            return "You potentially have COVID-19."
        }
        else{
            return "You are not likely to have COVID-19."
        }
    }
    func getText2()->String{
        if Double(percentage)*weightAvg >= 600{
            return "Please place yourself in quarantine immidiately, and schedule a COVID-19 test as soon as possible."
        }
        else if Double(percentage)*weightAvg >= 400{
            return "Please schedule a COVID-19 test as soon as possible and be sure to distance yourself from other people immidiately."
        }
        else if Double(percentage)*weightAvg >= 200{
            return "It is recommended that you schedule a COVID-19 test just to be safe. In the meantime, be extra careful in terms of social distancing and hygiene to prevent possible spread."
        }
        else{
            return "Keep in mind that many people are asymptomatic, so you still may be carrying the virus. If you are in doubt, schedule a COVID-19 test."
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(percentage: Binding.constant(3),weightAvg: Binding.constant(0.0))
    }
}
