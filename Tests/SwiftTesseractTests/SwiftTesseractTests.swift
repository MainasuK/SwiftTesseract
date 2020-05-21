import XCTest
@testable import SwiftTesseract

import Cocoa

final class SwiftTesseractTests: XCTestCase {
    
    func testSmoke() {
    
    }
    
    func testVersion() {
        XCTAssert(!Tesseract.version.isEmpty)
    }
    
}

// test api
extension SwiftTesseractTests {
    func testSetImage2() throws {
        let tesseract = Tesseract()
        try tesseract.init3(language: .english)
        
        let image = generateImage()
        try tesseract.setImage2(nsImage: image)
    }
    
    private func generateImage() -> NSImage {
        let rect = CGRect(x: 0, y: 0, width: 200, height: 200)
        let rep = NSBitmapImageRep(
            bitmapDataPlanes: nil,
            pixelsWide: Int(rect.width),
            pixelsHigh: Int(rect.height),
            bitsPerSample: 8,
            samplesPerPixel: 4,
            hasAlpha: true,
            isPlanar: false,
            colorSpaceName: NSColorSpaceName.calibratedRGB,
            bitmapFormat: NSBitmapImageRep.Format.alphaFirst,
            bytesPerRow: 0,
            bitsPerPixel: 0
        )!
        
        let context = NSGraphicsContext(bitmapImageRep: rep)
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = context
        
        NSColor.black.setFill()
        rect.fill()
        
        let attributedString = NSAttributedString(string: "Hello, World\n\tTesseract", attributes: [
            NSAttributedString.Key.font : NSFont.systemFont(ofSize: 60),
            NSAttributedString.Key.foregroundColor : NSColor.red,
        ])
        attributedString.draw(in: rect)
        
        NSGraphicsContext.restoreGraphicsState()
        
        let image = NSImage(size: rect.size)
        image.addRepresentation(rep)
        
        return image
    }
    
}

// test function
extension SwiftTesseractTests {
    
    func testTesseract_text() throws {
        let tesseract = Tesseract()
        // init
        try tesseract.init3(language: .english)
        
        // set image
        let folder = SwiftTesseractTests.urlForRestServicesTestsDir()
        let imageURL = folder
            .appendingPathComponent("SwiftTesseractTests")
            .appendingPathComponent("testing")
            .appendingPathComponent("phototest.tif")
        let image = NSImage(contentsOf: imageURL)!
        try tesseract.setImage2(nsImage: image)
        
        // recognize
        try tesseract.recognize()
        
        // get text
        let text = tesseract.text()
        XCTAssertNotNil(text)
        XCTAssert(text?.isEmpty == false)
    }
    
    func testTesseract_resultIterator() throws {
        let tesseract = Tesseract()
        let folder = SwiftTesseractTests.urlForRestServicesTestsDir()
        
        // init
        let tessdata = folder
            .appendingPathComponent("SwiftTesseractTests")
            .appendingPathComponent("testing")
            .appendingPathComponent("tessdata")
        try tesseract.init3(datapath: tessdata, language: .english)
        
        // set image
        let imageURL = folder
            .appendingPathComponent("SwiftTesseractTests")
            .appendingPathComponent("testing")
            .appendingPathComponent("phototest.tif")
        let image = NSImage(contentsOf: imageURL)!
        try tesseract.setImage2(nsImage: image)
        
        // recognize
        try tesseract.recognize()
        
        guard let iterator = tesseract.resultIterator() else {
            XCTFail()
            return
        }
        
        let level = Tesseract.PageIteratorLevel.word
        repeat {
            let text = iterator.text(level: level)
            XCTAssertNotNil(text)
            let confidence = iterator.confidence(level: level)
            let boundingBox = iterator.pageIterator().boundingBox(level: level)
            print("\(text ?? "nil") [\(confidence)] - \(boundingBox)")
        } while iterator.next(level: level) == true
    }
    
}

// helper
extension SwiftTesseractTests {
    
    static func urlForRestServicesTestsDir() -> URL {
        let currentFileURL = URL(fileURLWithPath: "\(#file)", isDirectory: false)
        return currentFileURL
            .deletingLastPathComponent()
            .deletingLastPathComponent()
    }
    
}
