//
//  NSView+Rx.swift
//  
//
//  Created by scchn on 2022/10/6.
//

#if os(macOS)

import AppKit

import RxSwift
import RxCocoa

extension Reactive where Base: NSView {
    
    public var frame: Observable<CGRect> {
        NotificationCenter.default.rx
            .notification(NSView.frameDidChangeNotification, object: base)
            .compactMap { $0.object as? NSView }
            .map(\.frame)
            .startWith(base.frame)
    }
    
    public var screen: Observable<NSScreen?> {
        NotificationCenter.default.rx
            .notification(NSWindow.didChangeScreenNotification)
            .compactMap { $0.object as? NSWindow }
            .filter { window in
                window == base.window
            }
            .map(\.screen)
            .startWith(.main)
    }
    
}

#endif
