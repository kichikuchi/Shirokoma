
import UIKit
import Shirokoma

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExampleTest().abTest { (condition) in
            
            if condition.condition == ExampleTest().A {
                print("A")
            } else if condition.condition == ExampleTest().B {
                print("B")
            } else if condition.condition == ExampleTest().C {
                print("C")
            }
            
        }
        
        let result = ExampleTest().condition()
        print(result)
    }
}

struct ExampleTest: Shirokoma {
    let A = "A"
    let B = "B"
    let C = "C"
    
    var conditions: Array<Condition> {
        return [
            Condition(condition:A, percentage: 70),
            Condition(condition:B, percentage: 20),
            Condition(condition:C, percentage: 10)
        ]
    }
}

