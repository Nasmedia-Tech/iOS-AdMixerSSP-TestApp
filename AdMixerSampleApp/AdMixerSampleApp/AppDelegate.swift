//
//  AppDelegate.swift
//  AdMixerSampleApp
//
//  Created by iOS Nasmedia on 12/11/24.
//

import UIKit
import AdMixerMediation
import AdMixer
import GoogleMobileAds

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AMMediation.shared.setDebugEnabled(isEnabled: true)
        AMMediation.shared.initialize(
            mediaKey: Constants.mediaKey,
            adunitID: [
                Constants.BannerAdUnit,
                Constants.InterstitialBannerAdUnit,
                Constants.VideoAdUnit,
                Constants.InterstitialVideoAdUnit,
                Constants.RewardVideoAdUnit
            ]
        )
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        AdMixerSDK.shared.debug(isEnabled: true)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
