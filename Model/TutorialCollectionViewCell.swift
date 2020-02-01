//
//  RecepieCollectionViewCell.swift
//  Cuisine101
//
//  Created by Nathalia Melare on 17/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
    
    let text: UITextView = {
        let tipsText = UITextView()
        tipsText.text = "Ovos sempre são algo complicado de se lidar, e quebra-los é o primeiro passo para fazer qualquer coisa, então nesse tutorial mostraremos como quebrar ovos de modo fácil e sem deixar as cascas cairem dentro da receita.\n \n Vamos lá: Primeiro pegue o ovo e segure-o com uma mão em formato de concha. Bata a superfície do ovo, de preferência próxima ao centro, na quina da mesa ou da pia devagar até rachar. \n \n Não use muita força, pois você pode quebrar a gema ou ovo pode estraçalhar.\n \n Segure o ovo em cima da tigela (ou do local que vai querer coloca-lo). \n \n  Depois disso, coloque seus dedões sobre a rachadura e seus outros dedos na parte de baixo do ovo. Agora, devagar, pressione seus dedões na rachadura e puxe os outros dedos ao mesmo tempo, formando um coração invertido. Deixe o ovo cair na tigela e pronto! Já pode adiciona-lo a suas receitas."
        tipsText.textColor = #colorLiteral(red: 0.4980472922, green: 0.4950307012, blue: 0.5003677011, alpha: 1)
        return tipsText
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
               addSubview(text)

        addConstrainsWithFormat(format: "H:|-20-[v0]-20-|", views: text)
        addConstrainsWithFormat(format: "V:|-30-[v0]|", views: text)
        addConstraints([NSLayoutConstraint(item: text, attribute: .topMargin, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 0)])
        
        text.frame.size = CGSize(width: UIScreen.main.bounds.size.width - 20, height: 600)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
