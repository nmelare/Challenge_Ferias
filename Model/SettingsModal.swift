//
//  BlackBackgroundAnimation.swift
//  Cuisine101
//
//  Created by Nathalia Melare on 16/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

class SettingsModal: NSObject {
    
    let blackView = UIView()
    var tutorialCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let recepieCollectionInformation = UICollectionView(frame: .zero, collectionViewLayout: layout)
        recepieCollectionInformation.backgroundColor = UIColor.white
        return recepieCollectionInformation
    }()
    let height:CGFloat = 600
    
    var tutorialCollectionViewDataSource = TutorialCollectionViewDataSource()
    var tutorialCollectionViewDelegate = TutorialCollectionViewDelegate()
    
    override init() {
        super .init()
        
        tutorialCollectionView.dataSource = tutorialCollectionViewDataSource
        tutorialCollectionView.delegate = tutorialCollectionViewDelegate
        tutorialCollectionView.register(RecepieCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    func handleMore() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
                   
            blackView.alpha = 0
            blackView.frame = window.frame
            
            window.addSubview(blackView)
            
        }
    }
    
    func firstAnimationModal() {
        if let window = UIApplication.shared.keyWindow {
            let y = window.frame.height - height
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
                self.tutorialCollectionView.frame = CGRect(x: 0, y: y, width: self.tutorialCollectionView.frame.width, height: self.tutorialCollectionView.frame.height)
            }
        }
    }
    
    func collectionViewSetUp() {
        if let window = UIApplication.shared.keyWindow {
            
            tutorialCollectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            window.addSubview(tutorialCollectionView)
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.tutorialCollectionView.frame = CGRect (x: 0, y: window.frame.height, width: self.tutorialCollectionView.frame.width, height: self.tutorialCollectionView.frame.height)
            }
        }
    }
}
