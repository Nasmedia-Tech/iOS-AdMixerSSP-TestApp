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
        let nativeAdView = nibView as? AMMNativeAdView
        
        ammNative = AMMNativeAdViewContainer()
        ammNative?.nativeAdView = nativeAdView
        addNativeViewToView(ammNative!)
        
        ammNative?.adUnitID = Constants.NativeAdUnit
        ammNative?.viewController = self
        ammNative?.delegate = self
        ammNative?.load()
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
    func onSuccessNative() {
        print("onSuccessNative")
    }
    
    func onFailNative() {
        print("onFailNative")
    }
}
