//
//  ContentView.swift
//  TimerDemo
//
//  Created by Thongchai Subsaidee on 8/9/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    private let  timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var qty: Int = 0
    @State var timerHandler: Cancellable?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! \(qty)")
        }
        .padding()
        .onAppear(
            
        )
        .onDisappear {
            
        }
        .onReceive(timer) { _ in
            qty = qty + 1
            if (qty > 5) {
                timerHandler?.cancel()
                qty = 999
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
