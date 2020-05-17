//
//  File.swift
//  
//
//  Created by Cirno MainasuK on 2020-5-17.
//

import Foundation
import Clibtesseract

extension Tesseract {
    public class PageIterator {
        let raw: OpaquePointer
        
        init(raw: OpaquePointer) {
            self.raw = raw
        }
        
        public func boundingBox(level: PageIteratorLevel) -> CGRect {
            var minX: Int32 = 0
            var minY: Int32 = 0
            var maxX: Int32 = 0
            var maxY: Int32 = 0
            
            let result = TessPageIteratorBoundingBox(raw, level.raw, &minX, &minY, &maxX, &maxY)
            guard result == 1 else {
                return .zero
            }
            
            return CGRect(x: Int(minX), y: Int(minY), width: Int(maxX - minX), height: Int(maxY - minY))
        }
    }
}
    
