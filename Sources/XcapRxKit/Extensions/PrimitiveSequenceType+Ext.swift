//
//  PrimitiveSequenceType+Ext.swift
//  
//
//  Created by scchn on 2022/10/5.
//

import Foundation

import RxSwift

extension PrimitiveSequenceType where Trait == SingleTrait {
    
    public func mapToVoid() -> PrimitiveSequence<Trait, Void> {
        map { _ in }
    }
    
    public func printNext() -> PrimitiveSequence<Trait, Element> {
        `do`(onSuccess: {
            print($0)
        })
    }
    
}

// MARK: - Bool

extension PrimitiveSequenceType where Trait == SingleTrait, Element == Bool {
    
    public func not() -> PrimitiveSequence<Trait, Element> {
        map(!)
    }
    
}
