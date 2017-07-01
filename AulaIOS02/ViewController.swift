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
    
    var myList: NSArray = NSArray()
    var starService = StarWarsServices()
    var indice = Int()
    var myItem: NSDictionary = [:]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //ADD button navigation
        //#selector - chama funcao, e recebe o return
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(reload) )
        
        //download do json

        starService.getAllPeople(urlDaString: "http://swapi.co/api/people", completionHandler: {
        
            result in
            print("TESTE")
            
            switch result {
            
            case .sucess(let list):
                let myKey = list[0] as! NSDictionary
                print("sucess: \(myKey)")
                
                
                    //recuperar os campos do json
                    let teste = myKey["gender"] as! String
                    print(teste)
                
                self.myList = list //carrega a lista no array
                self.myTableView.reloadData() //da um reload na tableView, vao rodar de novo o datasource e seus metodos, tipo o count
                
            case .failure(let error):
               
                print("error: \(error)")
            
            }
        })
        
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
        return myList.count
        
    }
    
    //atribui os dados a lista
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cellid"
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        
        let myKey = myList[indexPath.row] as! NSDictionary
        let name  = myKey["name"] as! String
        let gender = myKey["gender"] as! String
        
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = gender
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRow")//aqui é a ação da tela
        myItem =  myList[indexPath.row] as! NSDictionary //myItem dictionary montado apartir do array myLisT
        performSegue(withIdentifier: "detailsSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
                                                            //o as aqui funciona como um casting, precisa para acessar os metodos tipo o passedString
            let detalhesViewController = segue.destination as! DetailsViewController
            //passa pra view detalhes, na variavel item recebido o dictionary myItem
            detalhesViewController.itemRecebido = myItem
           
        }
    }

}

