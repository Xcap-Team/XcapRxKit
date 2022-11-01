//
//  NSWindow+Rx.swift
//  
//
//  Created by scchn on 2022/10/6.
//

#if os(macOS)

import AppKit

import RxSwift

extension Reactive where Base: NSWindow {
    
    public var screen: Observable<NSScreen?> {
        NotificationCenter.default.rx
            .notification(NSWindow.didChangeScreenNotification, object: base)
            .compactMap { $0.object as? NSWindow }
            .map(\.screen)
            .startWith(base.screen)
    }
    
}

#endif
