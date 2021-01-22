# TelaDeDetalhes

[![CI Status](https://img.shields.io/travis/bittencourthiago/TelaDeDetalhes.svg?style=flat)](https://travis-ci.org/bittencourthiago/TelaDeDetalhes)
[![Version](https://img.shields.io/cocoapods/v/TelaDeDetalhes.svg?style=flat)](https://cocoapods.org/pods/TelaDeDetalhes)
[![License](https://img.shields.io/cocoapods/l/TelaDeDetalhes.svg?style=flat)](https://cocoapods.org/pods/TelaDeDetalhes)
[![Platform](https://img.shields.io/cocoapods/p/TelaDeDetalhes.svg?style=flat)](https://cocoapods.org/pods/TelaDeDetalhes)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

How to use:

```swift

import UIKit
import TelaDeDetalhes

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func abreATela(_ sender: UIButton) {
        
        guard let nc = self.navigationController else { return }
        
        let newViewCOntroller = Detalhes(navigationController: nc)
        newViewCOntroller.abreDetalhes(initials:"BTC",currentValueOFCoin: "10.000,50", isFavorite: false, hourSell: "200.000,25", monthSell: "3.000.000,0", yearSell: "10.000.000,67")
    }
}


```

## Requirements

## Installation

TelaDeDetalhes is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TelaDeDetalhes', :git => 'https://github.com/bittencourthiago/TelaDeDetalhes.git'

```

## Author

bittencourthiago, thiago.bittc@gmail.com

## License

TelaDeDetalhes is available under the MIT license. See the LICENSE file for more info.
