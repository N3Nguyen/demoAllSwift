import Foundation
//protocol basic
protocol ExampleProtocol {
    var description: String { get }
    func exampleMethod()
}

struct ExampleStruct: ExampleProtocol {
    var description: String {
        return "An example struct"
    }
    
    func exampleMethod() {
        print("This is an example method")
    }
}

//protocol kế thừa
protocol InheritingProtocol: ExampleProtocol {
    func anotherMethod()
}

struct AnotherStruct: InheritingProtocol {
    var description: String {
        return "Another struct"
    }
    
    func exampleMethod() {
        print("Example method in AnotherStruct")
    }
    
    func anotherMethod() {
        print("Another method in AnotherStruct")
    }
}


//Liên kết các protocol
protocol FirstProtocol {
    func firstMethod()
}

protocol SecondProtocol {
    func secondMethod()
}

struct ComposedStruct: FirstProtocol, SecondProtocol {
    func firstMethod() {
        print("First method")
    }
    
    func secondMethod() {
        print("Second method")
    }
}

func useProtocolsTogether(instance: FirstProtocol & SecondProtocol) {
    instance.firstMethod()
    instance.secondMethod()
}
//Mở rộng protocol

protocol DefaultProtocol {
    func requiredMethod()
}
struct DefaultStruct: DefaultProtocol {
    func requiredMethod() {
        print("alo")
    }
    // requiredMethod được triển khai mặc định
}
//chuyển qua ViewControllerProtocolBasic theo dỗi extensionsProtocol

//Associated Types (Các loại liên kết)
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntArray: Container {
    typealias Item = Int
    var items = [Int]()
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//Protocols với Self requirements
protocol SelfRequirementProtocol {
    func doSomething() -> Self
}

class SelfRequirementClass: SelfRequirementProtocol {
    func doSomething() -> Self {
        return self
    }
}
