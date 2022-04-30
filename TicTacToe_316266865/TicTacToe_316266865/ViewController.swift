//
//  ViewController.swift
//  TicTacToe_316266865
//
//  Created by adar on 14/04/2022.
//

import UIKit

class ViewController: UIViewController {
    enum Move {
        case O
        case X
    }

    @IBOutlet weak var TurnL: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    var firstMove = Move.X
    var currentMove = Move.X
    var O = "O"
    var X = "X"
    var board = [UIButton]()
    var winningSets = [[UIButton]]()
    var oScore = 0
    var xScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateGame()
    }
    func initiateGame(){
        board.append(btn1)
        board.append(btn2)
        board.append(btn3)
        board.append(btn4)
        board.append(btn5)
        board.append(btn6)
        board.append(btn7)
        board.append(btn8)
        board.append(btn9)
        winningSets.append([btn1,btn2,btn3])
        winningSets.append([btn4,btn5,btn6])
        winningSets.append([btn7,btn8,btn9])
        winningSets.append([btn1,btn4,btn7])
        winningSets.append([btn2,btn5,btn8])
        winningSets.append([btn3,btn6,btn9])
        winningSets.append([btn1,btn5,btn9])
        winningSets.append([btn3,btn5,btn7])
    }


    @IBAction func tapAction(_ sender: UIButton) {
        toBoard(sender)
        if isWon(X)
        {
            xScore += 1
            alert(title: "X Won")
        }
        
        if isWon(O)
        {
            oScore += 1
            alert(title: "O Won!")
        }
        if (isFull()){
            alert(title: "Its a Draw")
        }
    }
    func isWon(_ s :String) -> Bool
    {
        for btnSet in winningSets{
            if compareMarks(btnSet[0], s) && compareMarks(btnSet[1], s) && compareMarks(btnSet[2], s){
                return true
            }
        }
        
        return false
    }
    func compareMarks(_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.layer.name == symbol
    }
    func alert(title: String) {
        let message = "\nO " + String(oScore) + "\n\nX " + String(xScore)
        let ac = UIAlertController(title:title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Retry", style: .default, handler: { (_) in self.retry()
        }))
        self.present(ac, animated: true)
    }
    
    func retry(){
        for btn in board{
            btn.layer.name = ""
            btn.setImage(UIImage(), for: .normal)
            btn.isEnabled = true
          }
        firstMove = Move.X
        TurnL.text = X
        currentMove = firstMove
    }
    
    func isFull() -> Bool {
        for btn in board{
            if btn.layer.name == nil||btn.layer.name  == ""{
                return false
            }
        }
        return true
    }
    
    func toBoard(_ sender: UIButton)
    {
        if(sender.layer.name == nil||sender.layer.name=="")
        {
            if(currentMove == Move.O){
            sender.layer.name = O
            sender.setImage(UIImage(named: "o.png"), for: .normal)
            currentMove = Move.X
            TurnL.text = X
            }
            else if(currentMove == Move.X){
            sender.layer.name = X
            sender.setImage(UIImage(named: "x.png"), for: .normal)
            currentMove = Move.O
            TurnL.text = O
            }
        }
    }
}
