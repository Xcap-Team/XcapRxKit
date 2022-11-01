//
//  ObservableType+Ext.swift
//  
//
//  Created by scchn on 2022/10/1.
//

import Foundation

import RxSwift
import RxCocoa

extension ObservableType {
    
    public func mapToVoid() -> Observable<Void> {
        map { _ in }
    }
    
    public func catchErrorJustComplete() -> Observable<Element> {
        `catch` { _ in .empty() }
    }
    
    public func asDriverOnErrorJustComplete() -> Driver<Element> {
        asDriver { _ in .empty() }
    }
    
    public func printNext() -> Observable<Element> {
        `do`(onNext: {
            print($0)
        })
    }
    
}

// MARK: - Bool

extension ObservableType where Element == Bool {
    
    public func not() -> Observable<Bool> {
        map(!)
    }
    
}
