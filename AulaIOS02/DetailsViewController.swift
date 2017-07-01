//
//  DetailsViewController.swift
//  AulaIOS02
//
//  Created by aluno on 01/07/17.
//  Copyright © 2017 aluno. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var labelSegundaTela: UILabel!
    @IBOutlet weak var labelSexo: UILabel!
    
    var passedString = [String]()
    var itemRecebido: NSDictionary = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // itemRecebido usada para receber da outra tela, la usa o mesmo nome
        labelSegundaTela.text = itemRecebido["name"] as! String
        labelSexo.text = itemRecebido["gender"] as! String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
