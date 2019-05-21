//
//  AppDelegate.swift
//  DemoExpandingCollection
//
//  Created by Alex K. on 25/05/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var window: UIWindow?
    var fireBaseRef: DatabaseReference!
    var firebaseStorage: Storage?


//    let gcmMessageIDKey = "gcm.message_id"

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        fireBaseRef = Database.database().reference()
        firebaseStorage = Storage.storage()
        configureNavigationTabBar()
        configurePushNotification()
	        return true
    }
    
    //MARK: - Configure Push Notification
    fileprivate func configurePushNotification() {
        //FirebaseApp.configure()
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                (granted, error) in
                // For iOS 10 display notification (sent via APNS)
                UNUserNotificationCenter.current().delegate = self
                // For iOS 10 data message (sent via FCM)
                Messaging.messaging().delegate = self
            }
            
        } else {
            let notificationSettings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(notificationSettings)
        }
        UIApplication.shared.registerForRemoteNotifications()
        
    }
    
    //MARK: - UIApplicationDelegate Methods
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        print(userInfo)
        
        //    let code = String.getString(message: userInfo["code"])
        guard let aps = userInfo["aps"] as? Dictionary<String, Any> else { return }
        guard (aps["alert"] as? String) != nil else { return }
        //    guard let body = alert["body"] as? String else { return }
        
        completionHandler([])
    }
    
    // Handle notification messages after display notification is tapped by the user.
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        print(userInfo)
        completionHandler()
    }
    
    //MARK: - Fire Messaging Delegates
    func application(received remoteMessage: MessagingRemoteMessage) {
        print(remoteMessage.appData)
    }

}


extension AppDelegate {

    fileprivate func configureNavigationTabBar() {
        //transparent background
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true

        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 2)
        shadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)

        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.shadow: shadow,
        ]
    }
}

