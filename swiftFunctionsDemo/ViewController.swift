//
//  ViewController.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 17/05/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        demoDispatchGroup()
        fetchDataAsync()
        
        let result = fetchDataSync()
        Thread.sleep(forTimeInterval:2)
        print(result)
        print("Tiếp tục với công việc khác")
    }

    
    func ThreadSwift() {
        let queue = DispatchQueue(label: "myQueue")
        queue.async {
            self.requestSomthing()
        }
        
        DispatchQueue.main.async {
            self.view.backgroundColor = .red
        }
        
    }

    func demoDispatchGroup() {

            let dispatchGroup = DispatchGroup()

            dispatchGroup.enter()
            for item in 1...10 {
                print("Load Data \(item)")
            }
            dispatchGroup.leave()
            
            dispatchGroup.enter()
            print("Execute Task 2")
            dispatchGroup.leave()
            
            dispatchGroup.notify(queue: .main) {
                print("Done")
            }
        }
    
    func requestSomthing() {
        
    }
    
    func fetchDataSync() {
        // tác vụ đồng bộ
        Thread.sleep(forTimeInterval: 2) // Dừng lại trong 2 giây
        print("Dữ liệu đã được tải xuống (Sync)")
    }

    func fetchDataAsync() {
        DispatchQueue.global().async {
            // tác vụ bất đồng bộ
            Thread.sleep(forTimeInterval: 5) // Dừng lại trong 2 giây
            print("Dữ liệu đã được tải xuống (Async)")
        }
    }
    
}

