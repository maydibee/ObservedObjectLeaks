//
//  TraceableObject.swift
//  ObservableLeaks
//
//  Created by Michael Skuratau on 04/02/25.
//

import Foundation


class TraceableObject: NSObject {
    var traceEnabled: Bool = true
    
    override init() {
        if self.traceEnabled {
            print("[\(String(describing: Self.self))] initializer called ⚠️")
        }
        super.init()
    }
    
    deinit {
        if self.traceEnabled {
            print("[\(String(describing: Self.self))] deinitializer called ✅")
        }
    }
}
