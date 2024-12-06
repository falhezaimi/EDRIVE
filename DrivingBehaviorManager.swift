import CoreMotion

class DrivingBehaviorManager {
    let motionManager = CMMotionManager()

    func startMonitoringDrivingBehavior() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { data, _ in
                if let acceleration = data?.acceleration {
                    if acceleration.x > 2.0 || acceleration.y > 2.0 {
                        print("Harsh driving detected")
                    }
                }
            }
        }
    }
}

