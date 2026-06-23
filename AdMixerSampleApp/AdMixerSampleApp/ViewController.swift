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
        
        let config = AMMInterstitialConfig()

        AMMInterstitial.load(adUnitID: Constants.InterstitialBannerAdUnit, config: config) { [weak self] interstitial, adapterName, error in
            guard let self else { return }
            if let error {
                print("AMMInterstitial error: \(error)")
            }
            
            if let interstitial {
                self.interstitialBanner = interstitial
                self.interstitialBanner?.delegate = self
                self.interstitialBanner?.show(rootViewController: self)
            }
        }
    }
    
    @IBAction func interstitialVideoButtonTapped(_ sender: Any) {
        
        AMMVideoInterstitial.load(adUnitID: Constants.InterstitialVideoAdUnit) { [weak self] videointerstitial, adapterName, error in
            guard let self else { return }
            
            if let error {
                print("AMMVideoInterstitial error: \(error)")
            }
            
            if let videointerstitial {
                self.interstitialVideo = videointerstitial
                self.interstitialVideo?.delegate = self
                self.interstitialVideo?.show(rootViewController: self)
            }
        }
    }
    
    @IBAction func videoButtonTapped(_ sender: Any) {
        let videoVC = VideoViewController()
        self.navigationController?.pushViewController(videoVC, animated: true)
    }
    
    @IBAction func rewardVideoButtonTapped(_ sender: Any) {
        
        AMMRewardVideo.load(adUnitID: Constants.RewardVideoAdUnit) { [weak self] reward, adapterName, error in
            guard let self else { return }
            
            if let error {
                print("AMMRewardVideo error: \(error)")
            }
            
            if let reward {
                self.rewardVideo = reward
                self.rewardVideo?.delegate = self
                self.rewardVideo?.show(rootViewController: self)
            }
        }
    }
    
    @IBAction func nativeButtonTapped(_ sender: Any) {
        let nativeVC = NativeViewController()
        self.navigationController?.pushViewController(nativeVC, animated: true)
    }
    
}

extension ViewController: AMMInterstitialDelegate {
    func onSuccessShowInterstitial() {
        print("onSuccessInterstitial")
    }
    
    func onFailShowInterstitial(error: Error?) {
        print("onFailInterstitial: \(error)")
    }
    
    func onClickInterstitial() {
        print("onClickInterstitial")
    }
    
    func onCloseInterstitial() {
        print("onCloseInterstitial")
    }
}

extension ViewController: AMMVideoInterstitialDelegate {
    func onSuccessShowVideoInterstitial() {
        print("onSuccessShowVideoInterstitial")
    }
    
    func onFailShowVideoInterstitial(error: Error?) {
        print("onFailShowVideoInterstitial: \(error)")
    }
    
    func onCloseVideoInterstitial() {
        print("onCloseVideoInterstitial")
    }
    
    func onClickVideoInterstitial() {
        print("onClickVideoInterstitial")
    }
    
    func onCompleteVideoInterstitial() {
        print("onCompleteVideoInterstitial")
    }
}

extension ViewController: AMMRewardVideoDelegate {
    func onSuccessShowReward() {
        print("onSuccessShowReward")
    }
    
    func onFailShowReward(error: Error?) {
        print("onFailShowReward: \(error)")
    }
    
    func onCloseRewardVideo() {
        print("onCloseRewardVideo")
    }
    
    func onClickRewardVideo() {
        print("onClickRewardVideo")
    }
    
    func onRewardVideoComplete() {
        print("onRewardVideoComplete")
    }
    
    func onRewardVideoEarned() {
        print("onRewardVideoEarned")
    }
}
