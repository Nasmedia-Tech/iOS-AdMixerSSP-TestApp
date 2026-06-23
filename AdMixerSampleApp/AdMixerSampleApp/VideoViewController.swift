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

        // static load: 로드 완료 시 completion 으로 비디오를 받아 addSubview → 화면 진입 시 노출
        AMMVideoView.load(adUnitID: Constants.VideoAdUnit, rootViewController: self) { [weak self] video, adapterName, error in
            guard let self else { return }
            if let error {
                print("AMMVideoView error: \(error)")
                return
            }
            guard let video else { return }
            self.ammVideo = video
            video.delegate = self
            self.addVideoViewToView(video)
        }
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
    func onSuccessShowVideo() {
        print("onSuccessShowVideo")
    }

    func onClickVideo() {
        print("onClickVideo")
    }

    func onSkipVideo() {
        print("onSkipVideo")
    }

    func onCompleteVideo() {
        print("onCompleteVideo")
    }
}
