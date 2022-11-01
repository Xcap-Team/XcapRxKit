//
//  NSColorWell+Rx.swift
//  
//
//  Created by scchn on 2022/10/6.
//

#if os(macOS)

import AppKit

import RxSwift
import RxCocoa

extension Reactive where Base: NSColorWell {
    
    public var color: ControlProperty<NSColor> {
        controlProperty(
            getter: { $0.color },
            setter: { $0.color = $1 }
        )
    }
    
}

#endif
