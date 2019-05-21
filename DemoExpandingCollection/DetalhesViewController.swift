//
//  DetalhesViewController.swift
//  Parcerias Barclays Moçambique
//
//  Created by Isidoro Pedro Da Silva Junior on 5/15/19.
//  Copyright © 2019 Alex K. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {

    //MARK: Variables

    var titulodetalheProduto = ""
    var ratingdetalheProduto = ""
    var telefonedetalheProduto = ""
    var emaildetalheProduto = ""
    var locationdetalheProduto = ""
    var descriptiondetalheProduto = ""
    var linkdetalhesProducto = ""
    
    @IBOutlet weak var titulodetalhe: UILabel!
    @IBOutlet weak var ratingdetalhe: UILabel!
    @IBOutlet weak var telefonedetalhe: UILabel!
    @IBOutlet weak var emaildetalhe: UILabel!
    @IBOutlet weak var locationdetalhe: UILabel!
    @IBOutlet weak var descriptiondetalhe: UITextView!
    @IBOutlet weak var linkdetalhes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        linkdetalhes.text = linkdetalhesProducto
        titulodetalhe.text = titulodetalheProduto
        ratingdetalhe.text = ratingdetalheProduto
        telefonedetalhe.text = telefonedetalheProduto
        emaildetalhe.text = emaildetalheProduto
        locationdetalhe.text = locationdetalheProduto
        descriptiondetalhe.text = descriptiondetalheProduto
}
    

}
