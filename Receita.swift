//
//  Maui.swift
//  Mulan
//
//  Created by Nathalia Melare on 13/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

//typealias Receitasz = [Receita]

struct Receita: Codable {
    var ingredientes: [String]
    var modoDePreparo: [String]
    var nomeDaImagem: String
    var nomeDaReceita: String
    var nomeDaImagem2: String
}

class InternReceita: NSObject {
    static func getAllRecepies() -> [Receita] {
        var recepies: [Receita] = []
        do {
            if let path = Bundle.main.path(forResource: NSLocalizedString("arquivoJson", comment: "nomeDoArquivoJson"), ofType: "json", inDirectory: nil)
            {
                let url = URL(fileURLWithPath: path)
                let recepiesData = try Data(contentsOf: url)
                recepies = try JSONDecoder().decode([Receita].self, from: recepiesData)
                return recepies
            }
        } catch {
            print("Erro")
        }
        return recepies
    }
    }
