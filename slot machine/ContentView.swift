//
//  ContentView.swift
//  slot machine
//
//  Created by Justine Kenji Dela Cruz on 7/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var credit = 1000
    @State var left = "cherry"
    @State var middle = "apple"
    @State var right = "star"
    var body: some View {
        VStack {
            Text("SwiftUi Slots")
                .font(.largeTitle)
                .padding()
            Spacer()
            Text("Credits: " + String(credit))
                .padding()
            Spacer()
            HStack{
                Image(left)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(middle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(right)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button(action:  {
                left = determineSlotImage(Int.random(in: 1...3))
                middle = determineSlotImage(Int.random(in: 1...3))
                right = determineSlotImage(Int.random(in: 1...3))
                if left == middle && middle == right{
                    credit += 25
                } else{
                    credit -= 25
                }
            }, label: {
                Text("Spin")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 6.0)
                    .padding(.horizontal, 18)
                    .background(Color.red)
                    .clipShape(Capsule())
            })
            Spacer()

        }
    }
    func determineSlotImage(_ randomNum: Int) -> String{
        switch randomNum{
        case 1:
            return "apple"
        case 2:
            return "star"
        default:
            return "cherry"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
