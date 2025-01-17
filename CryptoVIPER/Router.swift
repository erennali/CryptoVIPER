//
//  Router.swift
//  CryptoVIPER
//
//  Created by Eren Ali Koca on 17.01.2025.
//

import Foundation
import UIKit


//Class-protocol
//EntryPoint

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    
    var entry: EntryPoint?
    
    static func startExecution() -> any AnyRouter {
        
        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
}
