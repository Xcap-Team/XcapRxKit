//
//  SharedSequenceConvertibleType+Ext.swift
//  
//
//  Created by scchn on 2022/10/1.
//

import Foundation

import RxCocoa

extension SharedSequenceConvertibleType {
    
    public func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        map { _ in }
    }
    
    public func printNext() -> SharedSequence<SharingStrategy, Element> {
        `do`(onNext: {
            print($0)
        })
    }
    
}

// MARK: - Bool

extension SharedSequenceConvertibleType where Element == Bool {
    
    public func not() -> SharedSequence<SharingStrategy, Bool> {
        map(!)
    }
    
}
