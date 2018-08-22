//
//  MyCamViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/11.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import AVFoundation

class MyCamViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    let session = AVCaptureSession()
    let deviceInput = DeviceInput()
    
    @IBOutlet weak var forPreview: UIView!
    @IBAction func frontBackCamSwitch(_ sender: UISwitch) {
        
        session.beginConfiguration()
        session.removeInput(session.inputs.last!)
        if sender.isOn{
            
            session.addInput(deviceInput.backWildAngleCamera!)
            
        }else{
            
            session.addInput(deviceInput.frontWildAngleCamera!)
            
        }
        
        session.commitConfiguration()
        
    }
    
    func settingPreviewLayer(){
        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.frame = forPreview.bounds
        previewLayer.session = session
        previewLayer.videoGravity = .resizeAspectFill
        forPreview.layer.addSublayer(previewLayer)
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        print("GGG")
        for metaData in metadataObjects{
            
            if metaData is AVMetadataMachineReadableCodeObject{
                
                DispatchQueue.main.async {
                    print("GGGMM")
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        settingPreviewLayer()
//
//        // 將後置廣角鏡頭連接到協調器
//        session.addInput(deviceInput.backWildAngleCamera!)
//
//        // 設定輸出端為 meta 資料（e.g., 條碼內容）
//        let output = AVCaptureMetadataOutput()
//        session.addOutput(output)
//        // 接受所有可辨識的meta資料
//        output.metadataObjectTypes = output.availableMetadataObjectTypes
//        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.global())
//
//        // 讓資料開始流入
//        session.startRunning()
        
        
        settingPreviewLayer()
        session.addInput(deviceInput.backWildAngleCamera!)


        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.global())
        
        session.startRunning()
        // Do any additional setup   after loading the view.
//        view.bringSubview(toFront: <#T##UIView#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
