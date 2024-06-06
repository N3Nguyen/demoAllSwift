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
        //VD sử dụng GCD
//        fetchDataFromNetwork()
        //VD sử dụng OperationQueue
//        threadOperationQueue()
        //VD Main queue và Global queue
//        updateUI()
//        doBackgroundWork()
        //VD về độ ưu tiên Qos trong global queue
//        concurentQueue()
        
        //VD sysn và asyn
//        sysnchronousTask()
//        asynchronousTask()
//        qosDispathQueue()
    }
    
    func fetchDataFromNetwork() {
        // Tạo một queue riêng để thực hiện tác vụ background
        let backgroundQueue = DispatchQueue.global(qos: .background)
        
        backgroundQueue.async {
            // Mô phỏng việc lấy dữ liệu từ mạng
            print("Fetching data from network...")
            sleep(2) // Mô phỏng độ trễ mạng
            
            let data = "Fetched Data"
            
            // Chuyển về main thread để cập nhật giao diện
            DispatchQueue.main.async {
                print("Updating UI with data: \(data)")
            }
        }
    }
    
    func threadOperationQueue() {
        let operationQueue = OperationQueue()

        let operation1 = BlockOperation {
            print("Operation 1 started")
            sleep(1)
            print("Operation 1 finished")
        }

        let operation2 = BlockOperation {
            print("Operation 2 started")
            sleep(1)
            print("Operation 2 finished")
        }
        operation2.addDependency(operation1)

        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
    }
    
    func sysnchronousTask() {
        //giả sử chúng ta sẽ thực hiện các công việc của của func smile và love
        for _ in 1...5 {
            Thread.sleep(forTimeInterval: 1)
            self.smile()
        }
        for _ in 1...5 {
            Thread.sleep(forTimeInterval: 1)
            self.love()
        }
    }
    
    func asynchronousTask() {
        let queue = DispatchQueue.global(qos: .background)
        //ở ví dụ sau ta sẽ thực hiện đồng thời 2 tác vụ
        queue.async {
            for _ in 1...5 {
                Thread.sleep(forTimeInterval: 1)
                self.smile()
            }
        }
        
        queue.async {
            for _ in 1...5 {
                Thread.sleep(forTimeInterval: 1)
                self.love()
            }
        }
    }
    
    func demoDispatchGroup1() {
        let group = DispatchGroup()
        let queue = DispatchQueue.global()
        
        group.enter()
        queue.async {
            // Công việc 1
            print("Task 1 started")
            sleep(2) // Giả lập công việc mất 2 giây
            print("Task 1 completed")
            group.leave()
        }
        
        group.enter()
        queue.async {
            // Công việc 2
            print("Task 2 started")
            sleep(1) // Giả lập công việc mất 1 giây
            print("Task 2 completed")
            group.leave()
        }
    }
    
    func demoDispatchGroup2() {
        let group = DispatchGroup()
        let queue = DispatchQueue.global()

        queue.async(group: group) {
            // Công việc 1
            print("Task 1 started")
            sleep(2)
            print("Task 1 completed")
        }

        queue.async(group: group) {
            // Công việc 2
            print("Task 2 started")
            sleep(1)
            print("Task 2 completed")
        }
    }
    
    func smile(){
        print("*-_-*")
    }
    func love(){
        print("<3")
    }
    
    func concurentQueue(){
        let queue = DispatchQueue(label: "hóng ConcurrentQueue", qos: .default, attributes: .concurrent)
        let queueUserInteractive = DispatchQueue(label: "UserInteractive ConcurrentQueue", qos: .userInteractive, attributes: .concurrent)
        queue.async {
            for _ in 1...5 {
                Thread.sleep(forTimeInterval: 1)
                self.smile()
            }
        }
        
        queueUserInteractive.async {
            for _ in 1...5 {
                Thread.sleep(forTimeInterval: 1)
                self.love()
            }
        }
//        print("Current thread: \(Thread.current)")
    }
    
    func doBackgroundWork() {
        //Sử dụng global queue để chạy với mức độ ưu tiên là background
        DispatchQueue.global(qos: .background).async {
            //in ra luồng đang thực thi
            print("Background thread: \(Thread.current)")
            //Kiểm tra nếu luồng chính đang thực thi
            if Thread.isMainThread {
                print("Running on the main thread")
            } else {
                print("Running on a background thread")
            }
        }
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            //in ra luồng đang thực thi
            print("Main thread: \(Thread.current)")
            //Kiểm tra nếu luồng chính đang thực thi
            if Thread.isMainThread {
                print("Running on the main thread")
            } else {
                print("Running on a background thread")
            }
        }
    }
    
    func qosDispathQueue() {
        // Một hàng đợi tùy chỉnh với QoS là .userInitiated
        let queue1 = DispatchQueue(label: "qos userInitiated", qos: .userInitiated)
        // Một hàng đợi tùy chỉnh với QoS là .background
        let queue2 = DispatchQueue(label: "qos background", qos: .background)
        
//        let queue1 = DispatchQueue.global(qos: .userInitiated)
//        let queue2 = DispatchQueue.global(qos: .background)
        // Thực hiện một tác vụ với QoS .userInitiated
        queue1.async {
            Thread.sleep(forTimeInterval: 5)
            for i in 0..<5 {
                print("🔴", i)
            }
        }
        // Thực hiện một tác vụ với QoS .background
        queue2.async {
            Thread.sleep(forTimeInterval: 5)
            for i in 100..<105 {
                print("🔵", i)
            }
        }
        
        DispatchQueue.main.async {
            print("Đang thực hiện tác vụ chính.")
            // Đặt mã thực thi ở đây
            for i in 1...5 {
                print("Main Task: \(i)")
            }
        }
    }
}

