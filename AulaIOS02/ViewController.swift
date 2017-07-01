//
//  ViewController.swift
//  AulaIOS02
//
//  Created by aluno on 30/06/17.
//  Copyright © 2017 aluno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //ADD button navigation
        //#selector - chama funcao, e recebe o return
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(reload) )

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload() {
        print("reload")
        let alert = UIAlertController(title: "Information", message: "Deseja apagar o post?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) in
            print("Faz alguma coisa")})
        
        )
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: {(action: UIAlertAction!) in
            print("Botão cancelar")})
            
        )
        
        present(alert, animated: true, completion: nil)
    }


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ToucheBegan")
    }

    //Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cellid"
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        
        cell.textLabel?.text = "linha\(indexPath.row)"
        cell.detailTextLabel?.text = "details \(indexPath.row)"
        print("cell create")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRow")//aqui é a ação da tela
        performSegue(withIdentifier: "detailsSegue", sender: self)
        
    }

}

