//
//  ContentView.swift
//  SuccessAnimation
//
//  Created by Tatsuya Kaneko on 26/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Success Animation") {
                isSheetPresented = !isSheetPresented
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            VStack {
                SuccessView(
                    message: "Success",
                    onAnimationCompleted: {
                        isSheetPresented = false
                    }
                )
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
