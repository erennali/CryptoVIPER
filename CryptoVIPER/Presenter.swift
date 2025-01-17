//
//  Presenter.swift
//  CryptoVIPER
//
//  Created by Eren Ali Koca on 17.01.2025.
//

import Foundation

//class , protocol
// talks to interactor , router , view


enum NetworkError: Error {
    case networkFailed
    case parsingFailed 
}

protocol AnyPresenter {
    var interactor: AnyInteractor? { get set }
    var router: AnyRouter? { get set }
    var view : AnyView? { get set }
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)

}

class CryptoPresenter: AnyPresenter {
    
    var interactor: (any AnyInteractor)? {
        didSet {
            interactor?.downloadCrypto()
        }
    }
    
    var router: (any AnyRouter)?
    
    var view: (any AnyView)?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], any Error>) {
        switch result {
        case .success(let cryptos):
            //view.update
            view?.update(with: cryptos)
        case .failure(_):
            //view.update error
            view?.update(with: "Try again later")
        }
    }
    
    
}
