//
//  ContentView.swift
//  CoreMotionSample
//
//  Created by 今井幸宣 on 2020/07/10.
//  Copyright © 2020 yukinobu.imai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sensor = MotionSensor()
    
    var body: some View {
        VStack {
            Text(sensor.xStr)
            Text(sensor.yStr)
            Text(sensor.zStr)
            Button(action: {
                self.sensor.isStarted ? self.sensor.stop() : self.sensor.start()
            }) {
                self.sensor.isStarted ? Text("STOP") : Text("START")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
