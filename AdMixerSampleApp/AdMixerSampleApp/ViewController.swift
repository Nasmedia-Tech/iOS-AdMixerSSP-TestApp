//
//  ViewController.swift
//  AdMixerSampleApp
//
//  Created by iOS Nasmedia on 12/11/24.
//

import UIKit
import AdMixerMediation

class ViewController: UIViewController {

    var interstitialBanner: AMMInterstitial?
    var rewardVideo: AMMRewardVideo?
    var interstitialVideo: AMMVideoInterstitial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AdMixerSampleApp"
    }
    
    @IBAction func bannerButtonTapped(_ sender: Any) {
        let bannerVC = BannerViewController()
        self.navigationController?.pushViewController(bannerVC, animated: true)
    }
    
    @IBAction func interstitialBannerButtonTapped(_ sender: Any) {
        interstitialBanner = AMMInterstitial(rootViewController: self)
        interstitialBanner?.adUnitID = Constants.InterstitialBannerAdUnit
        interstitialBanner?.viewType = .popup
        
        interstitialBanner?.delegate = self
        interstitialBanner?.load()
    }
    
    @IBAction func interstitialVideoButtonTapped(_ sender: Any) {
        interstitialVideo = AMMVideoInterstitial(rootViewController: self)
        interstitialVideo?.adUnitID = Constants.InterstitialVideoAdUnit
        
        interstitialVideo?.delegate = self
        interstitialVideo?.load()
    }
    
    @IBAction func videoButtonTapped(_ sender: Any) {
        let videoVC = VideoViewController()
        self.navigationController?.pushViewController(videoVC, animated: true)
    }
    
    @IBAction func rewardVideoButtonTapped(_ sender: Any) {
        rewardVideo = AMMRewardVideo(rootViewController: self)
        rewardVideo?.adUnitID = Constants.RewardVideoAdUnit

        rewardVideo?.delegate = self
        rewardVideo?.load()
    }
    
    @IBAction func nativeButtonTapped(_ sender: Any) {
        let nativeVC = NativeViewController()
        self.navigationController?.pushViewController(nativeVC, animated: true)
    }
    
}

extension ViewController: AMMInterstitialDelegate {
    func onSuccessInterstitial() {
        print("onSuccessInterstitial")
    }
    
    func onFailInterstitial() {
        print("onFailInterstitial")
    }
}

extension ViewController: AMMVideoInterstitialDelegate {
    func onSuccessVideoInterstitial() {
        print("onSuccessVideoInterstitial")
    }
    
    func onFailVideoInterstitial() {
        print("onFailVideoInterstitial")
    }
    
    func onCloseVideoInterstitial() {
        print("onCloseVideoInterstitial")
    }
    
    func onTapVideoInterstitialViewMore() {
        print("onTapVideoInterstitialViewMore")
    }
    
    func onCompleteVideoInterstitial() {
        print("onCompleteVideoInterstitial")
    }
}


extension ViewController: AMMRewardVideoDelegate {
    func onSuccessRewardVideo() {
        print("onSuccessRewardVideo")
    }
    
    func onFailRewardVideo() {
        print("onFailRewardVideo")
    }
    
    func onCloseRewardVideo() {
        print("onCloseRewardVideo")
    }
    
    func onTapRewardVideo() {
        print("onTapRewardVideo")
    }
    
    func onRewardVideoComplete() {
        print("onRewardVideoComplete")
    }
}
