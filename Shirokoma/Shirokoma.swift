
import Foundation

let ShirokomaConditionKey = "com.shirokoma.condition"
let first = "condition"
let second = "percentage"

public typealias Condition = (condition: String, percentage: Int)
typealias UserDefaultsDictionary = [String: AnyObject]

public protocol Shirokoma {
    var conditions: Array<Condition> { get }
}

public extension Shirokoma {
    public func abTest( completion : (Condition -> Void)?) {
        completion?(self.condition())
    }
    
    public func condition() -> Condition {
        let ud = NSUserDefaults.standardUserDefaults()
        let userDefaultsKey = ShirokomaConditionKey + String(Self)
        let condition = ud.objectForKey(userDefaultsKey) as? UserDefaultsDictionary
        
        if let condition = condition {
            return deserializeDictionary(condition)
        } else {
            return selectCondition()
        }
    }
}

extension Shirokoma {
    
    func serializeTuple(tuple: Condition) -> UserDefaultsDictionary {
        return [
            first : tuple.condition,
            second : tuple.percentage
        ]
    }
    
    func deserializeDictionary(dictionary: UserDefaultsDictionary) -> Condition {
        return Condition(
            dictionary[first] as! String,
            dictionary[second] as! Int
        )
    }
    
    func selectCondition() -> Condition {
        
        let percentages = conditions.map { $0.percentage }
        let sum = percentages.reduce(0, combine: +)
        let rand = Int(arc4random_uniform(UInt32(sum)) + 1)
        
        var splits: Array<Int> = []
        var currentValue = 0
        
        for percentage in percentages {
            currentValue += percentage
            splits.append(currentValue)
        }
        
        let indexNum = splits.enumerate().filter { rand <= $0.element }.first!.index
        let condition = conditions[indexNum]
        
        saveCondition(condition)
        
        return condition
    }
    
    func saveCondition(condition: Condition) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let userDefaultsKey = ShirokomaConditionKey + String(Self)
        let conditionDictionary = serializeTuple(condition)
        userDefaults.setObject(conditionDictionary, forKey: userDefaultsKey)
        userDefaults.synchronize()
    }
}

