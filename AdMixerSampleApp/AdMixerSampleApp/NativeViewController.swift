//
//  NativeViewController.swift
//  AdMixerSampleApp
//
//  Created by iOS Nasmedia on 12/11/24.
//

import UIKit
import AdMixerMediation

class NativeViewController: UIViewController {

    var ammNative: AMMNativeAdViewContainer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let nibView = Bundle.main.loadNibNamed("AMMNativeAdView", owner: nil, options: nil)?.first
        guard let nativeAdView = nibView as? AMMNativeAdView else { return }

        // static load: 로드 완료 시 completion 으로 컨테이너를 받아 addSubview → 화면 진입 시 노출
        AMMNativeAdViewContainer.load(adUnitID: Constants.NativeAdUnit, rootViewController: self, nativeAdView: nativeAdView) { [weak self] container, adapterName, error in
            guard let self else { return }
            if let error {
                print("AMMNativeAdViewContainer error: \(error)")
                return
            }
            guard let container else { return }
            self.ammNative = container
            container.delegate = self
            self.addNativeViewToView(container)
        }
    }

    func addNativeViewToView(_ nativeView: UIView) {
        nativeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nativeView)
        NSLayoutConstraint.activate([
            nativeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nativeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nativeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
     }
}

extension NativeViewController: AMMNativeDelegate {
    func onSuccessShowNative() {
        print("onSuccessShowNative")
    }

    func onClickNative() {
        print("onClickNative")
    }
}
