//
//  ViewController.swift
//  testPageView
//
//  Created by Isidoro Pedro Da Silva Junior on 10/19/18.
//  Copyright © 2018 Isidoro Pedro Da Silva Junior. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

var DatabaseHandle : DatabaseHandle!

class ViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var scrollView: UIPageControl!
    @IBOutlet weak var onboardingContainer: UIView!
    @IBOutlet weak var skipBtn: UIButton!
    
    
    @IBAction func skipOnboarding(_ sender: UIButton) {
        sender.removeFromSuperview()
        onboardingContainer.removeFromSuperview()
}
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

}
    
        //End Action button to send code
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
}

//    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//        cell.contentView.layer.cornerRadius = 4.0
//        cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.clear.cgColor
//        cell.contentView.layer.masksToBounds = false
//        cell.layer.shadowColor = UIColor.white.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
//        cell.layer.shadowRadius = 4.0
//        cell.layer.shadowOpacity = 1.0
//        cell.layer.masksToBounds = false
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
//        return cell
//        }
}
