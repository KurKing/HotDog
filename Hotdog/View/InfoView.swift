//
//  InfoView.swift
//  Hotdog
//
//  Created by Oleksiy on 10.09.2020.
//  Copyright © 2020 Oleksiy. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    @State private var enableNotification = true
    @State private var backgroundRefresh = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5){
            Text("Hot dog app")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .shadow(radius: 2)
                .padding(.vertical, 10)
            
            Form{
                //MARK: Section #1
                Section(header: Text("Hot Dog")) {
                    
                    HStack {
                        Text("Product").foregroundColor(.gray)
                        Spacer()
                        Text("Hot Dog App")
                    }//:HStack
                    
                    HStack {
                        Text("Compatibility").foregroundColor(.gray)
                        Spacer()
                        Text("iPhone, iPad")
                    }//:HStack
                    
                    HStack {
                        Text("Developer").foregroundColor(.gray)
                        Spacer()
                        Text("Oleksii Kurkin")
                    }//:HStack
                    
                    HStack {
                        Text("GitHub nick").foregroundColor(.gray)
                        Spacer()
                        Text("KurKing")
                    }//:HStack
                    
                    HStack {
                        Text("Version").foregroundColor(.gray)
                        Spacer()
                        Text("1.0.0")
                    }//:HStack
                }//:Section #1
                
                //MARK: Section #2
                Section(header: Text("Sources")) {
                    
                    HStack {
                        Text("Frameworks").foregroundColor(.gray)
                        Spacer()
                        Text("CoreML, Vision")
                    }//:HStack
                    
                    HStack {
                        Text("MLModel").foregroundColor(.gray)
                        Spacer()
                        Text("Inceptionv3")
                    }//:HStack
                }//:Section #2
            }//:Form
        }//:VStack
        .frame(maxWidth: 640)
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 15)
                .padding(.trailing, 20)
                .accentColor(Color.secondary),
            alignment: .topTrailing
        )
    }//:Body
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

