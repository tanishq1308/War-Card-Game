//
//  ContentView.swift
//  WarCardGame
//
//  Created by Tanishq Kakkar on 17/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    
    var body: some View {
        
        ZStack() {
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)


            VStack() {
            
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack() {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    
                    // Generate a random number between 2 and 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // Update the score
                    if playerRand > cpuRand {
                        playerScore += 1
                    }
                    else if playerRand < cpuRand {
                        cpuScore += 1
                    }
                    else {
                        playerScore += 0
                        cpuScore += 0
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                
                Spacer()
            
                HStack() {
                    
                    Spacer()
                    
                    VStack() {
                        Text("Player")
                            .font(.largeTitle)
                            .padding(.bottom, 20.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack() {
                        Text("CPU")
                            .font(.largeTitle)
                            .padding(.bottom, 20.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                .foregroundColor(Color.white)
                .padding()
                .font(.largeTitle)
                Spacer()
            }
        }
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
