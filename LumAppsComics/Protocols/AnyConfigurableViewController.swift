//
//  AnyConfigurableViewController.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 20/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

private class _AnyConfigurableViewControllerBase<Presenter, View: LoadableProvidableView>: ConfigurableViewController, ProvidableViewController {
    
    init() {
        guard type(of: self) != _AnyConfigurableViewControllerBase.self else {
            fatalError("_AnyRowBase<Model> instances can not be created; create a subclass instance instead")
        }
    }
    
    func setPresenter(_ presenter: Presenter) {
        fatalError("Must override")
    }
    
    var presenter: Presenter! {
        get { fatalError("Must override") }
        set { fatalError("Must override") }
    }
    
    // Should be impletemented as lazy
    var customView: View {
        get { fatalError("Must override") }
    }
    
    // Contains the default implementation
    var _customView: View {
        get { fatalError("Must override") }
    }
    
    func setProvider(_ provider: View.Provider) {
        fatalError("Must override")
    }
    
    func reloadData(animated: Bool) {
        fatalError("Must override")
    }
    
}

private final class _AnyConfigurableViewControllerBox<Concrete: ConfigurableViewController & ProvidableViewController>: _AnyConfigurableViewControllerBase<Concrete.Presenter, Concrete.View> {
    
    // variable used since we're calling mutating functions
    var concrete: Concrete
    
    init(_ concrete: Concrete) {
        self.concrete = concrete
    }
    
    override func setPresenter(_ presenter: Presenter) {
        concrete.setPresenter(presenter)
    }
    
    override var presenter: Presenter! {
        get { return concrete.presenter }
        set { concrete.presenter = newValue }
    }
    
    // Should be impletemented as lazy
    override var customView: View {
        get { return concrete.customView }
    }
    
    // Contains the default implementation
    override var _customView: View {
        get { return concrete._customView }
    }
    
    override func setProvider(_ provider: View.Provider) {
        concrete.setProvider(provider)
    }
    
    override func reloadData(animated: Bool) {
        concrete.reloadData(animated: animated)
    }
    
}

final class AnyConfigurableViewController<Presenter, View: LoadableProvidableView>: ConfigurableViewController & ProvidableViewController {
    
    private let box: _AnyConfigurableViewControllerBase<Presenter, View>
    
    // Initializer takes our concrete implementer of Row i.e. FileCell
    init<Concrete: ConfigurableViewController & ProvidableViewController>(_ concrete: Concrete) where Concrete.Presenter == Presenter, Concrete.View == View {
        box = _AnyConfigurableViewControllerBox(concrete)
    }
    
    func setPresenter(_ presenter: Presenter) {
        box.setPresenter(presenter)
    }
    
    var presenter: Presenter! {
        get { return box.presenter }
        set { box.presenter = newValue }
    }
    
    // Should be impletemented as lazy
    var customView: View {
        get { return box.customView }
    }
    
    // Contains the default implementation
    var _customView: View {
        get { return box._customView }
    }
    
    func setProvider(_ provider: View.Provider) {
        box.setProvider(provider)
    }
    
    func reloadData(animated: Bool) {
        box.reloadData(animated: animated)
    }
    
}
