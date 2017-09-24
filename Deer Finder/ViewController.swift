//
//  ViewController.swift
//  Deer Finder
//
//  Created by Nathan Gupta on 9/23/17.
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    //MARK: Properties
    @IBOutlet weak var videoView: UIView!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoView.isHidden = true
        
        /*
        if (autoStart.isOn == true){
            startVideo()
        }
        */
        
    }
    
    //MARK: Actions
    @IBAction func startPressed(_ sender: UIButton) {
        videoView.isHidden = false
        startVideo()
    }
    
    
    func startVideo(){
        
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous deivce object
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object
            captureSession = AVCaptureSession()
            
            // Set the input device on the capture session
            captureSession?.addInput(input)
            
            
            //Initialise the video preview layer and add it as a sublayer to the viewPreview view's layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            videoView.layer.addSublayer(videoPreviewLayer!)
            
            //start video capture
            captureSession?.startRunning()
            
        } catch {
            //If any error occurs, simply print it out
            print(error)
            return
        }
        
    }


    
}

