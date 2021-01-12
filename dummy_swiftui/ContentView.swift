//
//  ContentView.swift
//  dummy_swiftui
//
//  Created by Kiu Ai on 1/12/21.
//

import SwiftUI

struct ContentView: View {
    
    enum CalculatorButton: String {
        case zero = "0", one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9"
        
        case equls = "=", plus = "+", minus = "-", multiply = "X", divide = "/"
        case ac = "AC", plusMinus = "+/-", percent = "%"
        
        var backgroundColor: Color {
            switch self {
            case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
                return Color(.darkGray)
            case .ac, .plusMinus, .percent:
                return Color(.lightGray)
            default:
                return .orange
            }
        }
    }
    
    let calculatorButtons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.four, .five, .six, .minus],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
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
                
                ForEach(calculatorButtons, id: \.self) { row in
                    HStack (alignment: .center, spacing: 12, content: {
                        ForEach(row, id: \.self) { button in
                            
                            Button (action: {}, label: {
                                Text(button.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: buttonWidth(), height: self.buttonWidth(), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .cornerRadius(buttonCornerRadius())
                            })
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
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}
