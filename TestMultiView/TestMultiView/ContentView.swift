//
//  ContentView.swift
//  TestMultiView
//
//  Created by Randy Robinson on 2/12/22.
//

import SwiftUI
import UIKit
import AVFoundation

struct ContentView: View {
    @State var opacity1: Double = 0.0
    @State var opacity2: Double = 1.0
    @State var inAppPurchase: Bool = UserDefaults.standard.bool(forKey: "inAppPurchaseState")
    @State var navigateToPurchases: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                NavigationLink(destination:PurchaseView(),
                               isActive: $navigateToPurchases,
                               label : {
                })
                VStack {
                    
                    Button(action: {
                        self.navigateToPurchases = true
                        determineOpacity()
                    }, label: {
                        Text("Purchase Upgrade")
                            .font(Font.custom("Marker Felt", size: 20.0))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.all, 5.0)
                    })
                        .buttonStyle(PlainButtonStyle())
                        .background(.blue)
                        .cornerRadius(15)
                        .padding(.bottom, 30)
                        .opacity(opacity2)
                    
                    Button(action: {
                        determineOpacity()
                    }, label: {
                        Text("Use Upgrade")
                            .font(Font.custom("Marker Felt", size: 20.0))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.all, 5.0)
                    })
                        .buttonStyle(PlainButtonStyle())
                        .background(.blue)
                        .cornerRadius(15)
                        .padding(.bottom, 30)
                        .opacity(opacity1)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .background(.orange)
            .onAppear() {
                determineOpacity()
            }
        }
    }
    
    func determineOpacity() {
        print(" ------------- Determine Opacity ------------")
        inAppPurchase = UserDefaults.standard.bool(forKey: "inAppPurchaseState")
        print("UserDefaultsValue: ", inAppPurchase)
        if inAppPurchase {
            print("Condition 1")
            opacity1 = 1.0
            opacity2 = 0.0
        }
        else {
            print("Condition 2")
            opacity1 = 0.0
            opacity2 = 1.0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
