//
//  PurchaseView.swift
//  TestMultiView
//
//  Created by Randy Robinson on 2/12/22.
//

import SwiftUI

struct PurchaseView: View {
    
    @State var inAppPurchase = false
    @State var goBack: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            NavigationLink(destination:ContentView(),
                           isActive: $goBack,
                           label : {
                Text("")
            })
                .navigationTitle("")
                .navigationBarHidden(true)
                .ignoresSafeArea()
                //.navigationViewStyle(StackNavigationViewStyle())
                .background(.blue)
            
            Button(action: {
                    UserDefaults.standard.set(true, forKey: "inAppPurchaseState")
                    print("******** Successful Purchase *********")
                    
                presentationMode.wrappedValue.dismiss() // this keeps views from stacking (i.e. it basically dismisses the NavigationView)
                goBack = true // this activates the dismissal of this view and returns to the calling view
            }, label: {
                Text("IAP Upgrade")
                    .font(Font.custom("Marker Felt", size: 20.0))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.all, 5.0)
            })
                .buttonStyle(PlainButtonStyle())
                .background(.red)
                .cornerRadius(15)
                .padding(.bottom, 20)
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
