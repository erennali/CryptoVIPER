//
//  View.swift
//  CryptoVIPER
//
//  Created by Eren Ali Koca on 17.01.2025.
//

import Foundation
import UIKit


//talks to presenter
//class , protocol
//viewcontroller

protocol AnyView {
    
    var presenter : AnyPresenter? { get set }
    
    //profesyonelce çalışma
    func update(with cryptos : [Crypto])
    func update(with error : String)
}

class CryptoViewController : UIViewController , AnyView , UITableViewDelegate , UITableViewDataSource {
    var presenter: AnyPresenter?
    
    var cryptos : [Crypto] = []
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        return tableView
    }()
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        //Ekran ne kadarsa tableviewda o kadar
        
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100 , y: view.frame.height / 2 - 25 , width: 200, height: 100)
    }
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.cryptos = []
            self.tableView.isHidden = true
            self.messageLabel.text = error
            self.messageLabel.isHidden = false
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = cryptos[indexPath.row].currency
                content.secondaryText = cryptos[indexPath.row].price
                cell.contentConfiguration = content
                cell.backgroundColor = .yellow
                return cell
    }
    
   
    
    
}
