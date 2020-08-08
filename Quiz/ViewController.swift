//
//  ViewController.swift
//  Quiz
//
//  Created by IOS SENAC on 08/08/20.
//  Copyright © 2020 IOS SENAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPergunta: UILabel!
    
    let perguntas: [String] = ["Café é bom?", "O céu não é azul?", "Pespi é melhor que Coca?", "Essas perguntas fazem algum sentido?"]
    var posicao: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configSwipes()
        posicao = 0
        carregaPergunta()
    }
    
    func configSwipes() {
        let direita = UISwipeGestureRecognizer(target: self, action: #selector(direcao(sender:)))
        direita.direction = .right
        let esquerda = UISwipeGestureRecognizer(target: self, action: #selector(direcao(sender:)))
        esquerda.direction = .left
        let acima = UISwipeGestureRecognizer(target: self, action: #selector(direcao(sender:)))
        acima.direction = .up
        let abaixo = UISwipeGestureRecognizer(target: self, action: #selector(direcao(sender:)))
        abaixo.direction = .down
        self.view.addGestureRecognizer(direita)
        self.view.addGestureRecognizer(esquerda)
        self.view.addGestureRecognizer(acima)
        self.view.addGestureRecognizer(abaixo)
    }
    
    func carregaPergunta() {
        txtPergunta.text = perguntas[posicao]
    }
    
    func respodePergunta(resposta: Bool) {
        switch posicao {
        case 0:
            if resposta {
                pulaPergunta(direcao: 1)
            }
            break;
        case 1:
            if !resposta {
                pulaPergunta(direcao: 1)
            }
            break;
        case 2:
            if !resposta {
                pulaPergunta(direcao: 1)
            }
            break;
        case 3:
            if resposta {
                pulaPergunta(direcao: 1)
            }
            break;
        default:
            break;
        }
    }
    
    func pulaPergunta(direcao: Int) {
        if posicao == 0 && direcao == -1 {
            posicao = perguntas.count - 1
        } else if posicao == 3 && direcao == 1 {
            posicao = 0
        } else {
            posicao += direcao
        }
        carregaPergunta()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func direcao(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
                case .right:
                    pulaPergunta(direcao: -1)
                    break;
                case .left:
                    pulaPergunta(direcao: 1)
                    break;
                case .up:
                    respodePergunta(resposta: true)
                    break;
                case .down:
                    respodePergunta(resposta: false)
                    break;
                default:
                    break;
                }
        }
    }
}

