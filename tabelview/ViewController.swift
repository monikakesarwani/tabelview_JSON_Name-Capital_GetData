//
//  ViewController.swift
//  tabelview
//
//  Created by Anil on 7/16/19.
//  Copyright © 2019 kesarwani. All rights reserved.

import UIKit

//https://www.youtube.com/watch?v=jMTw3JVYK70
//Source Code :- https://github.com/yogeshpatelios/Swift-4-Xcode-9---How-To-Parse-JSON-Data-/GET-in-TableView-Using-JsonDecoder-in-iOS-Latest-2017

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    
    var arrdata = [jsonstruct]()
    
    
    @IBOutlet weak var tabelview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        getdata()
        
    }

    func getdata(){
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                if error == nil{
                    self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                    
                    for mainarr in self.arrdata{
                        print(mainarr.name, ":", mainarr.capital )
                        DispatchQueue.main.async {
                            self.tabelview.reloadData()
                        }
                        
                    }
                }
            }catch{
                print("error in jsondata")
            }
        }.resume()
        

        
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.lblname.text = "Name : \(arrdata[indexPath.row].name)"
        cell.lablcapital.text = "Capital : \(arrdata[indexPath.row].capital)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
        
    }
    
    
}






