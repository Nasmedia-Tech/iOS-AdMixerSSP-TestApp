//
//  VideoViewController.swift
//  AdMixerSampleApp
//
//  Created by iOS Nasmedia on 12/11/24.
//

import UIKit
import AdMixerMediation

class VideoViewController: UIViewController {

    var ammVideo: AMMVideoView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        ammVideo = AMMVideoView()
        addVideoViewToView(ammVideo!)
        ammVideo?.adUnitID = Constants.VideoAdUnit
        
        ammVideo?.delegate = self
        ammVideo?.load()
    }
    
    func addVideoViewToView(_ videoView: UIView) {
        videoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(videoView)
        NSLayoutConstraint.activate([
            videoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            videoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            videoView.heightAnchor.constraint(equalToConstant: 400)
        ])
     }
}

extension VideoViewController: AMMVideoViewDelegate {
    func onSuccessVideo() {
        print("onSuccessVideo")
    }
    
    func onFailVideo() {
        print("onFailVideo")
    }
    
    func onSkipVideo() {
        print("onSkipVideo")
    }
    
    func onTapVideoViewMore() {
        print("onTapVideoViewMore")
    }
    
    func onCompleteVideo() {
        print("onCompleteVideo")
    }
}
