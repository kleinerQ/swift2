//
//  ViewController.swift
//  20180618_2_blueTooth_central
//
//  Created by Yen on 2018/6/18.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import CoreBluetooth
class ViewController: UIViewController,CBCentralManagerDelegate,CBPeripheralDelegate{
    
    @IBAction func readDataClick(_ sender: Any) {
    
        let characteristic = charDictionary[C001_CHARACTERISTIC]!
        connectPeripheral.readValue(for: characteristic)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3){
            self.view.endEditing(true)
        }
    }
    
    @IBAction func sendClick(_ sender: Any) {
        
        
        let string = textField.text ?? ""
        if textView.text.isEmpty{
            
            textView.text = string
        }else{
            
            textView.text = textView.text + "\n" + string
        }
        
        
        do{
            
            let data = string.data(using: .utf8)
            try sendData(data!, uuidString: C001_CHARACTERISTIC, writeType: .withResponse)
            
        }catch{
            print(error)
            
        }
        
        
    }
    
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBAction func subscribeValue(_ sender: UISwitch) {
        connectPeripheral.setNotifyValue(sender.isOn, for: charDictionary[C001_CHARACTERISTIC]!)
        
    }
    
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        guard central.state == .poweredOn else{
            return
        }
        
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let deviceName = peripheral.name else {
            return
        }
        print("找到藍牙裝置: \(deviceName)")
        
        guard deviceName.range(of: "kleinerq") != nil || deviceName.range(of: "Kleinerq") != nil else {
            return
        }
        
        central.stopScan()
        connectPeripheral = peripheral
        connectPeripheral.delegate = self
        centralManager.connect(connectPeripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        charDictionary = [:]
        peripheral.discoverServices(nil)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard error == nil else {
            print("Error : \(#file, #function)")
            print(error!.localizedDescription)
            return
        }
        for service in peripheral.services!{
            
            connectPeripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard error == nil else {
            print("Error : \(#file, #function)")
            print(error!.localizedDescription)
            return
            
        }
        
        for characteristic in service.characteristics!{
            let uuidString = characteristic.uuid.uuidString
            charDictionary[uuidString] = characteristic
            print("找到: \(uuidString)")
        }
        
    }
    
    func sendData(_ data: Data, uuidString: String, writeType:CBCharacteristicWriteType) throws{
        
        guard let characteritic = charDictionary[uuidString] else{
            throw SendDataError.CharacteristicNotFound
        }
        
        connectPeripheral.writeValue(data, for: characteritic,type: writeType)
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor descriptor: CBDescriptor, error: Error?) {
        if error != nil{
            
            print("寫入資料錯誤: \(error!)")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        guard error == nil else {
            print("Error : \(#file, #function)")
            print(error!)
            return
            
        }
        
        if characteristic.uuid.uuidString == C001_CHARACTERISTIC{
            
            let data = characteristic.value! as NSData
            let string = ">" + String(data: data as Data, encoding: .utf8)!
            print(string)
            
            DispatchQueue.main.async {
                if self.textView.text.isEmpty{
                    
                    self.textView.text = string
                }else{
                    
                    self.textView.text = self.textView.text + "\n" + string
                }
            }
        }
    }
    
    
    
    enum SendDataError: Error{
        
        case CharacteristicNotFound
    }
    
    let C001_CHARACTERISTIC = "C001"
    var centralManager: CBCentralManager!
    
    var connectPeripheral: CBPeripheral!
    var charDictionary = [String: CBCharacteristic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = DispatchQueue.global()
        centralManager = CBCentralManager(delegate: self, queue: queue)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

