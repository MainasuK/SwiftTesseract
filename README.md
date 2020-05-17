# SwiftTesseract

SwiftPM wrapper for Tesseract on macOS.


## Setup
```zsh
$ brew install tesseract

```

### Version
SwiftPM system lib wrapper do not supports version control. Please install the correct Tesseract version from Homebrew to avoid potential API breaking.

|Package Version|Tesseract Version|
|:---:|:---:|
|0.1.0|4.1.1|


## Usage
```swift
    let tesseract = Tesseract()
    
    // init
    try tesseract.init3(language: .english)
    
    // set image
    let image = NSImage(contentsOf: imageURL)!
    try tesseract.setImage2(nsImage: image)
    
    // recognize
    try tesseract.recognize()
    
    guard let iterator = tesseract.resultIterator() else {
        return
    }
    
    let level = Tesseract.PageIteratorLevel.word
    repeat {
        let text = iterator.text(level: level) ?? "<nil>"
        let confidence = iterator.confidence(level: level)
        let boundingBox = iterator.pageIterator().boundingBox(level: level)
        print("\(text) [\(confidence)] - \(boundingBox)")
    } while iterator.next(level: level) == true
```

### Input
[sample image](./Tests/SwiftTesseractTests/testing/phototest.tif)

### Result
```
This [96.59077] - (36.0, 92.0, 60.0, 24.0)
is [96.91542] - (109.0, 92.0, 20.0, 24.0)
a [96.33154] - (141.0, 98.0, 15.0, 18.0)
lot [96.33154] - (169.0, 92.0, 32.0, 24.0)
of [96.453545] - (212.0, 92.0, 28.0, 24.0)
12 [96.453545] - (251.0, 92.0, 31.0, 24.0)
point [96.469635] - (296.0, 92.0, 68.0, 30.0)
text [96.469635] - (374.0, 93.0, 53.0, 23.0)
to [96.88442] - (437.0, 93.0, 26.0, 23.0)
test [96.98443] - (474.0, 93.0, 52.0, 23.0)
the [96.370605] - (536.0, 92.0, 44.0, 24.0)
ocr [96.06626] - (36.0, 132.0, 45.0, 18.0)
code [96.06626] - (91.0, 126.0, 69.0, 24.0)
and [96.62016] - (172.0, 126.0, 51.0, 24.0)
see [96.534645] - (236.0, 132.0, 50.0, 18.0)
if [94.37445] - (299.0, 126.0, 15.0, 24.0)
it [94.37445] - (325.0, 126.0, 14.0, 24.0)
works [95.95861] - (348.0, 126.0, 85.0, 24.0)
on [93.535866] - (445.0, 132.0, 33.0, 18.0)
all [93.535866] - (500.0, 126.0, 29.0, 24.0)
types [96.89812] - (541.0, 127.0, 77.0, 30.0)
of [96.23404] - (36.0, 160.0, 28.0, 24.0)
file [95.72321] - (72.0, 160.0, 41.0, 24.0)
format. [95.67606] - (123.0, 160.0, 100.0, 24.0)
The [96.51174] - (36.0, 194.0, 55.0, 24.0)
quick [96.62931] - (102.0, 194.0, 75.0, 30.0)
brown [96.81818] - (189.0, 194.0, 85.0, 24.0)
dog [95.7896] - (287.0, 194.0, 52.0, 31.0)
jumped [95.7896] - (348.0, 194.0, 108.0, 31.0)
over [96.59911] - (468.0, 200.0, 63.0, 18.0)
the [96.49475] - (540.0, 194.0, 45.0, 24.0)
lazy [96.39718] - (37.0, 228.0, 55.0, 31.0)
fox. [96.44215] - (103.0, 228.0, 50.0, 24.0)
The [96.70259] - (165.0, 228.0, 55.0, 24.0)
quick [96.62862] - (232.0, 228.0, 75.0, 30.0)
brown [96.615715] - (319.0, 228.0, 85.0, 24.0)
dog [95.79648] - (417.0, 228.0, 51.0, 31.0)
jumped [95.79648] - (478.0, 228.0, 107.0, 31.0)
over [96.285324] - (36.0, 268.0, 63.0, 18.0)
the [96.28109] - (109.0, 262.0, 44.0, 24.0)
lazy [96.50949] - (165.0, 262.0, 56.0, 31.0)
fox. [96.30392] - (231.0, 262.0, 50.0, 24.0)
The [96.647934] - (294.0, 262.0, 55.0, 24.0)
quick [96.60692] - (360.0, 262.0, 75.0, 30.0)
brown [96.11609] - (447.0, 262.0, 85.0, 24.0)
dog [96.11609] - (545.0, 262.0, 52.0, 31.0)
jumped [96.72839] - (43.0, 296.0, 107.0, 31.0)
over [96.37651] - (162.0, 302.0, 64.0, 18.0)
the [96.37651] - (235.0, 296.0, 44.0, 24.0)
lazy [96.80211] - (292.0, 296.0, 55.0, 31.0)
fox. [96.771866] - (357.0, 296.0, 50.0, 24.0)
The [96.17355] - (420.0, 296.0, 55.0, 24.0)
quick [96.94925] - (486.0, 296.0, 75.0, 30.0)
brown [96.83297] - (37.0, 330.0, 85.0, 24.0)
dog [96.32232] - (135.0, 330.0, 52.0, 31.0)
jumped [96.80239] - (196.0, 330.0, 108.0, 31.0)
over [96.95346] - (316.0, 336.0, 63.0, 18.0)
the [96.56487] - (388.0, 330.0, 45.0, 24.0)
lazy [95.99435] - (445.0, 330.0, 55.0, 31.0)
fox. [96.61488] - (511.0, 330.0, 50.0, 24.0)
```
