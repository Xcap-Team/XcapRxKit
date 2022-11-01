//
//  NSPopUpButton+Rx.swift
//  
//
//  Created by scchn on 2022/10/6.
//

#if os(macOS)

import AppKit

import RxSwift
import RxCocoa

extension Reactive where Base: NSPopUpButton {
    
    public var selectionIndex: ControlProperty<Int> {
        controlProperty(
            getter: { $0.indexOfSelectedItem },
            setter: { $0.selectItem(at: $1) }
        )
    }
    
    public var select: ControlEvent<Int> {
        let select = controlEvent.map { self.base.indexOfSelectedItem }
        return ControlEvent(events: select)
    }
    
}

#endif
