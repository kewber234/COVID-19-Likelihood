//
//  QuestionsView.swift
//  COVID Likelihood
//
//  Created by Kenneth Yamashita on 8/28/20.
//  Copyright © 2020 Kenneth Yamashita. All rights reserved.
//

import SwiftUI

struct QuestionsView: View {
    let symptoms:[String] = ["Check all symptoms you are experiencing:","cough","hemoptysis"
        ,"fever","myalgia","chills","fatigue","headache","shortness of breath","sore throat","rhinorrhea","diarrhea","poor appetitie","nausea","chest pain","change in taste/smell","abdominal pain","wheezing","vomiting","nasal congestion","conjunctivitis","rash","dizziness","arthralgia","seizure","night sweats"]
    let defs:[String] = ["","reflex response to irritant in throat/airway","Airway bleeding in lung area","body temperature greater than 100.4 F","muscle pain or ache","Cold with no apparent cause resulting in shivering or shaking","Persistent exhaustion","pain in a region of the head","hard to breathe deeply","irritated or pained throat","runny rose","loose, watery stools","reduced desire to eat","discomfort in stomach leading to urge to vomit","discomfort between neck base and diaphragm","dull of senses ","pain between chest and pelvic area","high-pitched whistling sound when breathing","throwing up contents of the stomach","stuffy nose","infection of eye membranes lining eyelid and eye whites","irritated or pained area of skin ","feeling of surroundings are spinning or moving ","pain and swelling of joints","twitching or jerking of the body, difficulty speaking, lose ability to swallow, convulsions","extreme perspiration when sleeping"]
    let percents:[Int] = [0,84,5,80,63,63,62,59,57,35,33,34,32,31,25,20,20,13,12,7,6,3,3,2,1,2,24]
    let weights:[Double] = [0,4,1,4,3,3,3,3,3,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1]
    @State private var percentage = 0
    @State private var weightAvg = 0.0
    @State private var actives:[Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]//26
    @State private var defActive:Bool = false
    @State private var currentNum = 0
    var body: some View {
        NavigationView{
            ZStack{
                Image("BCKGRD2").resizable().edgesIgnoringSafeArea(.all).opacity(0.5)
            ScrollView(.vertical){
                ForEach(0..<6){_ in
                    Text("")
                }
                ForEach(0..<26){i in
                    ZStack{
                    CheckBoxView(text: self.symptoms[i], active:self.$actives[i]).onLongPressGesture {
                        self.currentNum = i
                        self.defActive = true
                    }.offset(x:-60)
                        Text(self.symptoms[i]).font(.custom("STHeitiSC-Medium", size: 17))
                    }
                    
                }
                Spacer()
            }.position(x: 200, y: 200).onDisappear(){
                self.percentage = self.getPercentage()
                self.weightAvg = self.getWeightAvg()
            }

                NavigationLink(destination: ResultsView(percentage: self.$percentage,weightAvg: self.$weightAvg)) {
                    ZStack{
                        Rectangle().frame(width:170,height:50).foregroundColor(Color.blue.opacity(0.9)).cornerRadius(150)
                        Text("RESULTS").foregroundColor(.white).font(.system(size: 22))
                    }
                }.frame(width:170,height:50).position(x: 190, y: 515)
                if self.defActive{
                ZStack{
                    Text("\(self.defs[currentNum])").foregroundColor(.white).multilineTextAlignment(.center).font(.system(size: 22)).padding(30).padding(.vertical,70).background(Color.blue).cornerRadius(20).offset(y:-40)
                }.onTapGesture {
                    self.defActive = false
                    }
                    
                }
            }.navigationBarTitle("Quiz",displayMode: .inline)
        }    }
    func getPercentage() -> Int{
        var p = 0
        for i in 0...26{
            if self.actives[i] == true{
                p += percents[i]
            }
        }
        return p
    }
    func getWeightAvg() -> Double{
        var t = 0.0
        var num = 0.0
        for i in 0...26{
            if self.actives[i] == true{
                t += weights[i]
                num+=1.0
            }
        }
        return t/num
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}
