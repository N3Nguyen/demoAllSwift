import UIKit

protocol SomeProtocol {
    // protocol definition goes here
}

protocol AnotherProtocol {
    // protocol definition goes here
}

struct SomeStructure: SomeProtocol, AnotherProtocol {
    // structure definition goes here
}
class ViewControllerProtocolBasic: UIViewController, SomeProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        extensionsProtocol()
        
        
        let intContainer = IntArray(items: [1, 2, 3, 4, 5])
        let intArray = makeArray(of: intContainer)
        print(intArray) // Output: [1, 2, 3, 4, 5]

    }
    func extensionsProtocol() {
        let instance = DefaultStruct()
        instance.requiredMethod() // Output: Default implementation of requiredMethod
    }
    
    func makeArray<C: Container>(of container: C) -> [C.Item] {
        var result = [C.Item]()
        for i in 0..<container.count {
            result.append(container[i])
        }
        return result
    }

}

//extension ViewControllerProtocolBasic: DefaultProtocol{
//    func requiredMethod() {
//        print("Default implementation of requiredMethod")
//    }
//}
