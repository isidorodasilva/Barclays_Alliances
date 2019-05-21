//
//  DesignTableViewController.swift
//  
//
//  Created by Isidoro Pedro Da Silva Junior on 5/8/19.
//

import UIKit
import Firebase
import FirebaseDatabase

class DesignTableViewController: UITableViewController {
    var escolhido: ItemInfo!
    var clickedButton: Int!
    var descricao: String!
    
    typealias ItemInfo = (Titulo: String, Description: String, Rating: String, photo: String, email: String, location: String, telefone: String, Linkdetalhes: String)
//    typealias ItemInfo = (imageName: String, Titulo: String, Description: String, photo: String)
//    fileprivate var cellsIsOpen = [Bool]()
//    fileprivate var items: [ItemInfo]! = [("item4", "Jamson","maputo"),
//               ("item1", "New York","maputo"), ("item2", "San Francisco","maputo"),
//                 ("item3", "Washington","maputo"),("item4", "Jamson","maputo")]
    
      fileprivate var items: [ItemInfo]! = [( "Titulo","Description","Rating","photo","email","location","telefone", "Linkdetalhes")]

//    fileprivate var items: [ItemInfo]! = [ ("item3", "Washington","maputo","text"),
//                                           ("item4", "Jamson","maputo","Text")]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)

        
        switch clickedButton {
        case 1:
            items.removeAll()
            
            
            (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
                let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
                let dictAliances = dictRoot["Aliances"] as? [String: AnyObject] ?? [:]
                //new strategy for image
                func showImage(){
                    Database.database().reference().child("Aliances").child("photo").observeSingleEvent(of: .value, with: { snapshot in
                        if let url = snapshot.value as? String {
                            URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
                                if error == nil {
                                    let imageName = UIImage(data: data!)
                                }
                                }.resume()
                        }
                    })
                }
                
                for key in Array(dictAliances.keys) {
                    let alianceDic = dictAliances[key]
                    self.items.append(("item4", alianceDic!["Title"] as! String, alianceDic!["Description"] as! String, alianceDic!["Rating"] as! String, alianceDic!["photo"] as! String, alianceDic!["email"] as! String, alianceDic!["location"] as! String, alianceDic!["Linkdetalhes"] as! String))
                    self.tableView.reloadData()
                    print("**** \(self.items)")
                }
                print(dictAliances)
            })
            self.tableView?.reloadData()
            
        case 2:
            items.removeAll()
            (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
                let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
                let dictAliances = dictRoot["Eventos"] as? [String: AnyObject] ?? [:]
                for key in Array(dictAliances.keys) {
                    let alianceDic = dictAliances[key]
                      self.items.append(("item4", alianceDic!["Title"] as! String, alianceDic!["Description"] as! String, alianceDic!["Rating"] as! String, alianceDic!["photo"] as! String, alianceDic!["email"] as! String, alianceDic!["location"] as! String, alianceDic!["Linkdetalhes"] as! String ))
                    self.tableView?.reloadData()
                    print("**** \(self.items)")
                }
                print(dictAliances)
            })
            
            
        case 3:
            items.removeAll()
            (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
                let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
                let dictAliances = dictRoot["Newsletter"] as? [String: AnyObject] ?? [:]
                for key in Array(dictAliances.keys) {
                    let alianceDic = dictAliances[key]
                       self.items.append(("item4", alianceDic!["Title"] as! String, alianceDic!["Description"] as! String, alianceDic!["Rating"] as! String, alianceDic!["photo"] as! String, alianceDic!["email"] as! String, alianceDic!["location"] as! String, alianceDic!["Linkdetalhes"] as! String))
                    self.tableView?.reloadData()
                    print("**** \(self.items)")
                }
                print(dictAliances)
            })
        default:
            break
        }
    }
            
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "hello", for: indexPath) as! itemTableViewCell        
        
    let item = self.items[indexPath.row]
        cell.Title.text = item.Titulo
        cell.Description.text = item.Description
        cell.Rating.text = item.Rating
        return cell

    }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "exemplo", sender: nil)
            self.escolhido = items[indexPath.row]
            
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "exemplo"){
                let vc = segue.destination as! DetalhesViewController
                
                vc.descriptiondetalheProduto = self.escolhido.Description
                vc.titulodetalheProduto = self.escolhido.Titulo
                vc.ratingdetalheProduto = self.escolhido.Rating
                vc.telefonedetalheProduto = self.escolhido.telefone
                vc.emaildetalheProduto = self.escolhido.email
                vc.locationdetalheProduto = self.escolhido.location
                vc.linkdetalhesProducto = self.escolhido.Linkdetalhes
            }
        }
}
