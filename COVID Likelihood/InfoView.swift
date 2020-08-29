//
//  InfoView.swift
//  COVID Likelihood
//
//  Created by Kenneth Yamashita on 8/28/20.
//  Copyright © 2020 Kenneth Yamashita. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack{
            Image("BCKGRD3").resizable().edgesIgnoringSafeArea(.all).opacity(0.7)
            VStack{
                Text("OUR MISSION").bold().font(.custom("STHeitiSC-Medium", size: 19))
                Text("To estimate the likelihood of COVID based on experienced symptoms and provide further guidance based on the result. We want to make a platform where users can privately and anonymously check on their health and take action if necessary with confidence. ").font(.custom("STHeitiSC-Medium", size: 14)).padding()
                Text("BEFORE TAKING THE QUIZ").bold().font(.custom("STHeitiSC-Medium", size: 19))
                Text("This is quiz is made on the assumption that you meet some basic requirements:\n\n1. You have not received a vaccine in the last 48 hours \n\n2. You have maintained a healthy eating and drinking schedule within the last three days. \n\n3. You have gotten at least 5 to 8 hours of sleep within the last two days.\n\n4. You are not undergoing any tremendously stressful situations that can cause similar symptoms to COVID-19.\n\n Any deviances from these requirements may hinder the accuracy of this quiz to some degree").font(.custom("STHeitiSC-Medium", size: 14)).padding()//.fixedSize()
            }.offset(y:-5)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
