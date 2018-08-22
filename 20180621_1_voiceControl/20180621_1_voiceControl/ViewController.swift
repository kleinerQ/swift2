//
//  ViewController.swift
//  20180621_1_voiceControl
//
//  Created by Yen on 2018/6/21.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import Speech
class ViewController: UIViewController {
    @IBAction func onStopTalk(_ sender: Any) {
        
        if let audioRecorder = audioRecoder{
            audioRecorder.stop()
            let request = SFSpeechURLRecognitionRequest(url: tmpURL)
            
            
            recongnizer.recognitionTask(with: request) { (result, error) in
                
                
                if let result = result {
                    if result.isFinal {
                        
                        let text = result.bestTranscription.formattedString
                        self.textView.text = text
                        
                        if text.contains("打開"){
                            self.ctrlLed(isOn: true)
                        }
                        
                        if text.contains("燈關掉"){
                            self.ctrlLed(isOn: false)
                        }
                        
                        
                    }
                    
                }
                
                self.btnTalk.isEnabled = true
                self.btnRecognizer.isEnabled = false
                
            }
        }
    }
    @IBAction func onTalk(_ sender: Any) {
        
        if let audioRecorder = audioRecoder{
            
            let session = AVAudioSession.sharedInstance()
            do{
                
                try session.setCategory(AVAudioSessionCategoryRecord)
                try session.setMode(AVAudioSessionModeMeasurement)
                try session.setActive(true, with: .notifyOthersOnDeactivation)
            }catch{
                
                print("session 設定失敗, \(error)")
            }
            
            audioRecorder.record()
            btnTalk.isEnabled = false
            btnRecognizer.isEnabled = true
        }
    }
    
    func ctrlLed(isOn:Bool){
        var url: URL? = nil
        
        if isOn {
            
            url = URL(string: (ledURL + "1"))
            
            
        }else{
            
            url = URL(string: (ledURL + "0"))
            
        }
        
        DispatchQueue.global().async {
            let _ = try! String(contentsOf: url!)
        }
        
        
        
    }
    
    var ledURL = "http://192.168.211.153/cgi-bin/ledForCellControll.cgi?isOn="
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var btnRecognizer: UIButton!
    @IBOutlet weak var btnTalk: UIButton!
    
    let recongnizer = SFSpeechRecognizer(locale: Locale(identifier: "zh_Hant_TW"))!
    let tmpURL = URL(fileURLWithPath: NSTemporaryDirectory() + "audio.m4a")
    var audioRecoder: AVAudioRecorder?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRecognizer.isEnabled = false
        SFSpeechRecognizer.requestAuthorization{(status) in
            
            DispatchQueue.main.async {
                switch status {
                    
                case .authorized:
                    self.btnTalk.isEnabled = true
                default:
                    self.btnTalk.isEnabled = false
                    
                }
            }
            
            
            
        }
        
        let settings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC)
        ]
        
        audioRecoder = try! AVAudioRecorder(url: tmpURL, settings: settings)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

