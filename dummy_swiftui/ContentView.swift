//
//  ContentView.swift
//  dummy_swiftui
//
//  Created by Kiu Ai on 1/12/21.
//

import SwiftUI

struct ContentView: View {
    
    let buttons = [
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "="],
        ["0", ".", ".", "X"]
    ]
    
    var body: some View {
        ZStack (alignment: .bottom, content: {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 12, content: {
                HStack {
                    Spacer()
                    Text("42")
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack (alignment: .center, spacing: 12, content: {
                        ForEach(row, id: \.self) { button in
                            Text(button)
                                .font(.system(size: 32))
                                .frame(width: buttonWidth(), height: self.buttonWidth(), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .background(Color.yellow)
                                .cornerRadius(buttonCornerRadius())
                        }
                    })
                }
            }).padding()
        })
    }
    
    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    func buttonCornerRadius() -> CGFloat {
        buttonWidth() / 2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
