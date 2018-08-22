//
//  ViewController.swift
//  20180618_1_blueTooth
//
//  Created by Yen on 2018/6/18.
//  Copyright © 2018年 Yen. All rights reserved.
//

import Cocoa
import CoreBluetooth

class ViewController: NSViewController,CBPeripheralManagerDelegate {
    
    @IBAction func sendClick(_ sender: Any) {
        
        let string = textField.stringValue
        if textView.string.isEmpty{
            
            textView.string = string
        }else{
            
            textView.string = textView.string + "\n" + string
        }
        do{
            
            let data = string.data(using: .utf8)
            try sendData(data!, uuidString: C001_CHARACTERISTIC)
            
        }catch{
            
            print(error)
            
        }
        
    }
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet var textView: NSTextView!
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        guard peripheral.state == .poweredOn else{
            print(peripheral.state.rawValue)
            return
        }
        
        var service: CBMutableService
        var characteristic: CBMutableCharacteristic
        var charArray = [CBCharacteristic]()
        
        service = CBMutableService(type: CBUUID(string: A001_SERVICE), primary: true)
        characteristic = CBMutableCharacteristic(type: CBUUID(string: C001_CHARACTERISTIC), properties: [.notifyEncryptionRequired, .write, .read], value: nil, permissions: [.writeEncryptionRequired, .readEncryptionRequired])
        
        charDictionary[C001_CHARACTERISTIC] = characteristic
        
        charArray.append(characteristic)
        service.characteristics = charArray
        
        peripheralManager?.add(service)
        
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        guard error == nil else{
            
            print("Error:{\(#file, #function)}\n")
            print(error!.localizedDescription)
            return
        }
        
        
        let deviceName = "我的ABC裝置"
        
        peripheral.startAdvertising([CBAdvertisementDataServiceUUIDsKey: [service.uuid],CBAdvertisementDataLocalNameKey: deviceName])
    }
    
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        print("開始廣播")
    }
    
    
    func sendData(_ data: Data, uuidString: String) throws{
        
        guard let characteritic = charDictionary[uuidString] else{
            throw SendDataError.CharacteristicNotFound
        }
        
        peripheralManager?.updateValue(data, for: characteritic, onSubscribedCentrals: nil)
        
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        if peripheral.isAdvertising {
            
            
            peripheral.stopAdvertising()
            print("停止廣播")
        }
        
        if characteristic.uuid.uuidString == C001_CHARACTERISTIC{
            
            print("訂閱 C001")
            do{
                
                let data = "Hello Central".data(using:  .utf8)
                try sendData(data!, uuidString: C001_CHARACTERISTIC)
            }catch{
                print(error)
            }
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        if characteristic.uuid.uuidString == C001_CHARACTERISTIC{
            print("取消訂閱C001")
        }
    }


    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        guard let at = requests.first else{
            
            return
        }
        guard let data = at.value else{
            return
        }
        
        if at.characteristic.uuid.uuidString == C001_CHARACTERISTIC{
            
            peripheral.respond(to: at, withResult: .success)
            let string = ">" + String(data: data, encoding: .utf8)!
            print(string)
            
            DispatchQueue.main.async {
                if self.textView.string.isEmpty{
                    
                    self.textView.string = string
                    
                }else{
                    
                    self.textView.string = self.textView.string + "\n" + string
                }
            }
            
        }
        
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        request.value = nil
        if request.characteristic.uuid.uuidString == C001_CHARACTERISTIC{
            
            let data = "What do you want?".data(using:  .utf8)
            request.value = data
        }
        
        peripheral.respond(to: request, withResult: .success)
    }
    
    enum SendDataError: Error{
        
        case CharacteristicNotFound
    }
    
    let C001_CHARACTERISTIC = "C001"
    
    let A001_SERVICE = "A001"

    
    var peripheralManager: CBPeripheralManager?
    var charDictionary = [String: CBMutableCharacteristic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let queue  = DispatchQueue.global()
        peripheralManager = CBPeripheralManager(delegate: self, queue: queue)
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

