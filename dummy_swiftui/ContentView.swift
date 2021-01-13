//
//  ContentView.swift
//  dummy_swiftui
//
//  Created by Kiu Ai on 1/12/21.
//

import SwiftUI

enum CalculatorButton: String {
    case zero = "0", one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9"
    
    case equls = "=", plus = "+", minus = "-", multiply = "X", divide = "/"
    case ac = "AC", plusMinus = "+/-", percent = "%", dot = "."
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}

class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    
    func receiveInput(calculatorButton: CalculatorButton) {
        self.display = calculatorButton.rawValue
    }
}

struct ContentView: View {
    @EnvironmentObject var env: GlobalEnvironment
        
    let calculatorButtons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equls],
    ]
    
    var body: some View {
        ZStack (alignment: .bottom, content: {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 12, content: {
                HStack {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                ForEach(calculatorButtons, id: \.self) { row in
                    HStack (alignment: .center, spacing: 12, content: {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button)
                        }
                    })
                }
            }).padding()
        })
    }
    
    
}

struct CalculatorButtonView: View {
    var button: CalculatorButton
    @EnvironmentObject var env: GlobalEnvironment

    var body: some View {
        Button (action: {
            env.receiveInput(calculatorButton: button)
        }, label: {
            Text(button.rawValue)
                .font(.system(size: 32))
                .frame(width: buttonWidth(button: button), height: self.buttonDefaultWidthHeigh(), alignment: .center)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(buttonWidth(button: button))
        })
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        let defaultWidth = buttonDefaultWidthHeigh()
        
        if button == .zero {
            return (defaultWidth * 2) + 12
        }
        
        return defaultWidth
    }
    
    private func buttonDefaultWidthHeigh() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(GlobalEnvironment())
        }
    }
}
