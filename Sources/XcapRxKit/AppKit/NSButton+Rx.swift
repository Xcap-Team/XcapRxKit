//
//  NSButton+Rx.swift
//  
//
//  Created by scchn on 2022/10/6.
//

#if os(macOS)

import AppKit

import RxSwift
import RxCocoa

extension Reactive where Base: NSButton {
    
    public var on: ControlProperty<Bool> {
        controlProperty(
            getter: { $0.state == .on },
            setter: { $0.state = $1 ? .on : .off }
        )
    }
    
    public var toggle: ControlEvent<Bool> {
        let event = controlEvent.map { base.state == .on }
        return .init(events: event)
    }
    
}

#endif
