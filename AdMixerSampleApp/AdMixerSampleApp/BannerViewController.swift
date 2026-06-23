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

        // static load: 로드 완료 시 completion 으로 배너를 받아 addSubview → 화면 진입 시 노출
        AMMBannerView.load(adUnitID: Constants.BannerAdUnit, rootViewController: self) { [weak self] banner, adapterName, error in
            guard let self else { return }
            if let error {
                print("AMMBannerView error: \(error)")
                return
            }
            guard let banner else { return }
            self.ammbanner = banner
            banner.delegate = self
            self.addBannerViewToView(banner)
        }
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
    func onSuccessShowBanner() {
        print("onSuccessShowBanner")
    }

    func onClickBanner() {
        print("onClickBanner")
    }
}
