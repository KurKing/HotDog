//
//  AnswerView.swift
//  Hotdog
//
//  Created by Oleksiy on 10.09.2020.
//  Copyright © 2020 Oleksiy. All rights reserved.
//

import SwiftUI

struct AnswerView: View {
    
    //MARK: - Properties
    
    let answer: Bool
    @Binding var showAnswer: Bool
    
    let haptics = UINotificationFeedbackGenerator()
    
    //MARK: - Body
    var body: some View {
        
        VStack{
            Text(answer ? "It`s a hot dog!" : "It`s not a hot dog!")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .shadow(radius: 1)
                .frame(maxWidth: .infinity)
                .background(
                    Color(answer ? .green : .red)
                    
            )
            
            Spacer()
            
            Image(answer ? "hotdog" : "not-hotdog")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220, alignment: .center)
            
            Spacer()
            
            Button(action: {
                
                self.haptics.notificationOccurred(.success)
                playSound(sound: "sound-rise", type: "mp3")
                
                self.showAnswer = false
                
            }) {
                Text("OK!")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .shadow(radius: 1)
                    .frame(maxWidth: .infinity)
                    .background(
                        Color(answer ? .green : .red)
                        
                )
            }
            
        }//:VStack
            
            .frame(width: 350, height: 350, alignment: .center)
            .background(
                Color(red: 0, green: 0, blue: 0, opacity: 0.3)
        )
            .cornerRadius(20)
    }//:Body
}//end.

struct AnswerView_Previews: PreviewProvider {
    @State static var show = false
    
    static var previews: some View {
        AnswerView(answer: true, showAnswer: $show)
            .previewLayout(.sizeThatFits)
    }
}
