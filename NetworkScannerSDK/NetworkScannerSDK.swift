//
//  NetworkScannerSDK.swift
//  NetworkScannerSDK
//
//  Created by Alisher on 05.06.2024.
//

import Foundation
import SwiftUI
import Combine
import MMLanScan

public class NetworkScannerSDK: NSObject, ObservableObject, MMLANScannerDelegate {
    @Published public private(set) var devices: [String: MMDevice] = [:]
    private var lanScanner: MMLANScanner!
    private var localIPAddress: String?

    public var deviceArray: [MMDevice] {
        return Array(devices.values)
    }
    
    public override init() {
        super.init()
        self.lanScanner = MMLANScanner(delegate: self)
        self.localIPAddress = NetworkUtils.getLocalIPAddress()
    }

    public func getDevices() -> [MMDevice] {
        return Array(devices.values).map { device in
            let modifiedDevice = device
            modifiedDevice.isLocalDevice = (device.ipAddress == self.localIPAddress)
            return modifiedDevice
        }
    }
    
    public func startScanning() {
        self.lanScanner.start()
    }

    public func stopScanning() {
        self.lanScanner.stop()
    }
    
    public func lanScanDidFindNewDevice(_ device: MMDevice!) {
        DispatchQueue.main.async {
            if let device = device {
                if self.devices[device.ipAddress] == nil {
                    self.devices[device.ipAddress] = device
                }
            }
        }
    }

    public func lanScanDidFinishScanning(with status: MMLanScannerStatus) {
        DispatchQueue.main.async {
            print("Scan Finished: \(status)")
        }
    }

    public func lanScanDidFailedToScan() {
        DispatchQueue.main.async {
            print("Scan failed")
        }
    }
}
