//
//  ViewController.swift
//  Detect-a-Beacon
//
//  Created by Артур Азаров on 10.08.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // MARK: - Properties
    
    private var locationManager: CLLocationManager!
    
    // MARK: - Outlets
    @IBOutlet var distanceReading: UILabel!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    // MARK: - Methods
    private func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways && CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) && CLLocationManager.isRangingAvailable() {
            startScanning()
        }
        
    }
}

