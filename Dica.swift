//
//  TeFiti.swift
//  Mulan
//
//  Created by Nathalia Melare on 14/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

//typealias Tutorial = [Tutorialz]

struct Dica: Codable {
    var palavraschave: [String]
    var dicas: String
    var nomedaimagem: String
    var nomeDaDica: String
    var nomedaimagem2: String
}

class InternDica: NSObject {
    static func getAllTutoriall() -> [Dica] {
        var tutoriall: [Dica] = []
        do {
            if let path = Bundle.main.path(forResource: "teste2", ofType: "json", inDirectory: nil)
            {
                let url = URL(fileURLWithPath: path)
                let tutoriallData = try Data(contentsOf: url)
                tutoriall = try JSONDecoder().decode([Dica].self, from: tutoriallData)
                return tutoriall
            }
        } catch {
            print("Erro")
        }
        return tutoriall
}
}
