//
//  Then.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/23/24.
//

import UIKit

public protocol Then { }

public extension Then where Self: Any {
  
  func then(_ apply: (inout Self) -> Void) -> Self {
    var configurableSelf = self
    apply(&configurableSelf)
    
    return configurableSelf
  }
}

public extension Then where Self: AnyObject {
  
  func then(_ apply: (Self) -> Void) -> Self {
    apply(self)
    return self
  }
}

extension NSObject: Then { }
extension Array: Then { }
extension Dictionary: Then { }
extension Set: Then { }
