//
//  NSSlider+Rx.swift
//  
//
//  Created by scchn on 2022/10/6.
//

#if os(macOS)

import AppKit

import RxSwift
import RxCocoa

extension Reactive where Base: NSSlider {
    
    public var slide: Observable<Double> {
        controlEvent.map {
            base.doubleValue
        }
    }
    
}

#endif
