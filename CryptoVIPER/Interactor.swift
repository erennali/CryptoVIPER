//
//  Interactor.swift
//  CryptoVIPER
//
//  Created by Eren Ali Koca on 17.01.2025.
//

import Foundation

//Class,protocol
// talks to presenter

//interactor görevi download edip presentera haber vermek


protocol AnyInteractor {
    var presenter: AnyPresenter? { get set}
    
    func downloadCrypto()
}

class CryptoInteractor: AnyInteractor {
    
    var presenter: (any AnyPresenter)?
    
    func downloadCrypto() {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/refs/heads/master/crypto.json") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data , error == nil else {
            
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.networkFailed))
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            }catch {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.parsingFailed))
            }
        
        }
        //bunu yazmasan hiçbir zaman çalışmaz
        task.resume()
        
        
        
    }
    
    
}
