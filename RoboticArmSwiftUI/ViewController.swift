//
//  ViewController.swift
//  RoboticArmSwiftUI
//
//  Created by Emre on 9.06.2019.
//  Copyright © 2019 EmreSURK. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    let portName = "/dev/cu.usbmodem14201"
    var serialPort: SerialPort! = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        serialPort = SerialPort(path: portName)
        serialPort.setSettings(receiveRate: .baud9600, transmitRate: .baud9600, minimumBytesToRead: 1)
       
        
        // Do any additional setup after loading the view.
    }

    @IBAction func xAxisSlider(_ sender: NSSlider) {
        //print(sender)
        //print(sender.intValue)
        let currentValue = sender.intValue
        //let commandString = "\(currentValue),\(currentValue),\(40)"
        let commandString = "3 \(currentValue)"
        print(commandString)
        let _ = try! serialPort.writeString(commandString)
        //let readed = try! serialPort.readLine()
        //print(readed)
        //print(written)
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewDidAppear() {
        do {
            try serialPort.openPort()
            sleep(1)
            let res = try serialPort.writeString("40,40,40")
            let readed = try serialPort.readLine()
            print(res)
            print(readed)
        } catch {
            print(error)
        }
    }

}

