//
//  ErrorTracker.swift
//  
//
//  Created by scchn on 2022/10/1.
//

import Foundation

import RxSwift
import RxCocoa

extension ErrorTracker {
    
    public typealias SharingStrategy = DriverSharingStrategy
    
}

public class ErrorTracker: SharedSequenceConvertibleType {
    
    private let _subject: PublishSubject<Error>
    private let _lock = NSRecursiveLock()
    
    deinit {
        _subject.onCompleted()
    }
    
    public init() {
        _subject = .init()
    }
    
    private func onError(_ error: Error) {
        _lock.lock()
        _subject.onNext(error)
        _lock.unlock()
    }

    public func trackError<O: ObservableConvertibleType>(from source: O) -> Observable<O.Element> {
        source.asObservable()
            .do(onError: onError(_:))
    }

    public func asSharedSequence() -> SharedSequence<SharingStrategy, Error> {
        _subject.asDriverOnErrorJustComplete()
    }

    public func asObservable() -> Observable<Error> {
        _subject
    }
    
}

extension ObservableConvertibleType {
    
    public func trackError(_ errorTracker: ErrorTracker) -> Observable<Element> {
        errorTracker.trackError(from: self)
    }

}
