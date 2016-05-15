# Shirokoma

Shirokoma is a A/B testing library written in Swift.

## Usage

Check out the included example project

### Create struct which inherit Shirokoma protocol

```swift
#import Shirokoma

struct ExampleTest: Shirokoma {
    var conditions: Array<Condition> {
        return [
            Condition(condition:"A", percentage: 70),
            Condition(condition:"B", percentage: 20),
            Condition(condition:"C", percentage: 10)
        ]
    }
}
```

### A/B testing

```swift
ExampleTest().abTest { (condition) in

            if condition.condition == "A" {
                print("A")
            } else if condition.condition == "B" {
                print("B")
            } else if condition.condition == "C" {
                print("C")
            }

        }

let result = ExampleTest().condition()
print(result)
```

## Requirements

* Swift 2.2
* iOS 8.0 or later

## Installation

* Add `github "kichikuchi/Shirokoma"`
* Run `carthage update`

## License

The MIT License (MIT)

Copyright (c) 2016 Kazunori Kikuchi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
