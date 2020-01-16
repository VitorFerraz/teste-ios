//
//  Observable.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

class Observable<T> {
    typealias ObservableClosure = (_ model: T) -> Void
    private var handle: ObservableClosure?
    private var thread: DispatchQueue?

    var value: T {
        didSet {
            onNext()
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func subscribe(_ block: @escaping ObservableClosure) {
        handle = block
    }

    func onNext() {
        guard let thread = thread else {
            handle?(value)
            return
        }
        thread.async { [weak self] in
            guard let self = self else { return }
            self.handle?(self.value)
        }
    }

    @discardableResult
    func onMainThread() -> Self {
        thread = .main
        return self
    }
}
