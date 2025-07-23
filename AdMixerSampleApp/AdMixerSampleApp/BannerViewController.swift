//
//  BannerViewController.swift
//  AdMixerSampleApp
//
//  Created by iOS Nasmedia on 12/11/24.
//

import UIKit
import AdMixerMediation

class BannerViewController: UIViewController {

    var ammbanner: AMMBannerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        ammbanner = AMMBannerView(width: view.frame.size.width)
        addBannerViewToView(ammbanner!)
        ammbanner?.adUnitID = Constants.BannerAdUnit
        ammbanner?.viewController = self
        ammbanner?.delegate = self
        ammbanner?.load()
    }
    
    func addBannerViewToView(_ bannerView: UIView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
     }
}

extension BannerViewController: AMMBannerViewDelegate {
    func onSuccessBanner() {
        print("onSuccessBanner")
    }
    
    func onFailBanner() {
        print("onFailBanner")
    }
}
