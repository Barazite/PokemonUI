//
//  Base.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import Foundation

protocol BaseInteractorProtocol: AnyObject{
    
}

protocol BasePresenterProtocol: AnyObject {
    
}

class BasePresenter{
    internal var baseInteractor: BaseInteractorProtocol?
    required init() {}
}

class BaseInteractor{
    internal weak var basePresenter: BasePresenterProtocol?
    required init() {}
}

class BaseCoordinator{
    
    static func assembly<Presenter: BasePresenter, Interactor: BaseInteractor>(presenter: Presenter.Type, interactor: Interactor.Type?) -> (presenter: Presenter, interactor: Interactor){
        let basePresenter = Presenter()
        let baseInteractor = Interactor()
        basePresenter.baseInteractor = baseInteractor as? BaseInteractorProtocol
        baseInteractor.basePresenter = basePresenter as? BasePresenterProtocol
        return (basePresenter, baseInteractor)
    }
}
