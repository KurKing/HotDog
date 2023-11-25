//
//  ContentView.swift
//  Hotdog
//
//  Created by Oleksiy on 10.09.2020.
//  Copyright © 2020 Oleksiy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var image = UIImage(named: "logo")!
    
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingInfoView = false
    
    @State private var showingAnswer = false
    @State private var answer = false
    
    private let logic = Logic()
    
    func loadImage() {
        
        guard let inputImage = inputImage else { return }
        image = inputImage
        
        if let ciImage = CIImage(image: image){
            DispatchQueue.global(qos: .background).async {
                self.showAnswer(result: logic.detect(image: ciImage))
            }
        }
    }
    
    func showAnswer(result: Bool) {
        
        showingAnswer = true
        answer = result
    }
    
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 0) {
                //MARK: Header
                HStack(alignment: .center, spacing: 0){
                    
                    Spacer().frame(width: 40)
                    Spacer()
                    
                    Text("Hot dog")
                        .foregroundColor(.white)
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .shadow(radius: 4)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showingInfoView.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .regular))
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    .sheet(isPresented: $showingInfoView) {
                        InfoView()
                    }
                }//:HStack
                .padding(.horizontal)
                .padding(.top, 10)
                
                //MARK: Main Image View
                Spacer()
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                    .cornerRadius(20)
                    .padding()
                Spacer()
                
                //MARK: Footer button
                Button(action: {
                    self.showingImagePicker = true
                }) {
                    Image(systemName: "camera.circle")
                        .font(.system(size: 80, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 3, x: 0, y: 0)
                        .padding()
                }//:Button
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage)
                }
            }//:VStack
            .padding(.bottom, 20)
            .frame(maxWidth: 640, maxHeight: .infinity, alignment: .center)
            .background(
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .blur(radius: $showingAnswer.wrappedValue ? 5 : 0, opaque: false)
            
            if $showingAnswer.wrappedValue {
                AnswerView(answer: answer, showAnswer: $showingAnswer)
            }
        }//:ZStack
    }//:Body
}//end.

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
