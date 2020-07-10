//
//  MotionSensor.swift
//  CoreMotionSample
//
//  Created by 今井幸宣 on 2020/07/10.
//  Copyright © 2020 yukinobu.imai. All rights reserved.
//

import UIKit
import CoreMotion

class MotionSensor: NSObject, ObservableObject {
    
    @Published var isStarted = false
    
    @Published var xStr = "0.0"
    @Published var yStr = "0.0"
    @Published var zStr = "0.0"
    
    let motionManager = CMMotionManager()
    
    func start() {
        
        // start monitoring sensor data
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {(motion:CMDeviceMotion?, error:Error?) in
                self.updateMotionData(deviceMotion: motion!)
            })
        }
        
        isStarted = true
    }
    
    func stop() {
        isStarted = false
        motionManager.stopDeviceMotionUpdates()
    }
    
    private func updateMotionData(deviceMotion:CMDeviceMotion) {
    
        xStr = String(deviceMotion.userAcceleration.x)
        yStr = String(deviceMotion.userAcceleration.y)
        zStr = String(deviceMotion.userAcceleration.z)
    }
    
}
