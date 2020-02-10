//
//  RecepieCollectionViewCell.swift
//  Cuisine101
//
//  Created by Nathalia Melare on 17/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Set Up Tutorial Text
    let text: UITextView = {
        let tipsText = UITextView()
        tipsText.text = "1.  Pegue o ovo e segure-o com uma mão em formato de concha. Bata a superfície do ovo, de preferência próxima ao centro, na quina da mesa ou da pia devagar até rachar. \n \n2.  Não use muita força, pois você pode quebrar a gema ou ovo pode estraçalhar.\nSegure o ovo em cima da tigela (ou do local que vai querer coloca-lo). \n \n3.  Depois disso, coloque seus dedões sobre a rachadura e seus outros dedos na parte de baixo do ovo. Agora, devagar, pressione seus dedões na rachadura e puxe os outros dedos ao mesmo tempo, formando um coração invertido. Deixe o ovo cair na tigela e pronto! Já pode adiciona-lo a suas receitas."
        tipsText.textColor = #colorLiteral(red: 0.4980472922, green: 0.4950307012, blue: 0.5003677011, alpha: 1)
        tipsText.isEditable = false
        tipsText.backgroundColor = .none
        return tipsText
    }()
    
    // MARK: - Set Up Tutorial Title
    let title: UILabel = {
        let title = UILabel()
        title.text = "Como Quebrar Ovos"
        title.textColor = #colorLiteral(red: 0.9320240021, green: 0.7159546018, blue: 0.3065403104, alpha: 0.8470588235)
        title.font = .systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.3))
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
      // MARK: - Set Up Constrains Tutorial Text
        addSubview(text)

        addConstrainsWithFormat(format: "H:|-20-[v0]|", views: text)
        addConstrainsWithFormat(format: "V:|-40-[v0]|", views: text)
        addConstraints([NSLayoutConstraint(item: text, attribute: .topMargin, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 0)])
            
        text.frame.size = CGSize(width: UIScreen.main.bounds.size.width - 20, height: 600)
        
        // MARK: - Set Up Constrains Tutorial Title
        addSubview(title)
        
        addConstrainsWithFormat(format: "H:|[v0]|", views: title)
        addConstrainsWithFormat(format: "V:|-(-450)-[v0]|", views: title)
        
        // MARK: - Set Up Background Color
        if #available(iOS 13.0, *) {
            self.backgroundColor = UIColor.systemGray6
        } else {
            self.backgroundColor = UIColor.white
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
