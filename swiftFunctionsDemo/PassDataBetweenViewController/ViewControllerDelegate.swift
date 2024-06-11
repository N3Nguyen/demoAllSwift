//
//  ViewControllerDelegate.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 05/06/2024.
//

import UIKit

protocol passDataDelegate: AnyObject {
    func didReceiveData(_ data: String?)
}

class ViewControllerDelegate: UIViewController {
    
    @IBOutlet weak var passDataDelegateButton: UIButton!
    @IBOutlet weak var passDataNotificationButton: UIButton!
    @IBOutlet weak var passDataClosureButton: UIButton!
    
    @IBOutlet weak var passDataTextView: UITextView!
    weak var delegate: passDataDelegate?
    var dataPass: String?
    
    var completionHandler: ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        passDataDelegateButton.applyAnimatedButtonStyle()
        passDataNotificationButton.applyAnimatedButtonStyle()
        passDataClosureButton.applyAnimatedButtonStyle()
        passDataTextView.layer.cornerRadius = 10
        passDataTextView.text = dataPass
    }
    
    @IBAction func backA(_ sender: Any) {
    }
    
    @IBAction func passData(_ sender: Any) {
        let a = passDataTextView.text.description
        delegate?.didReceiveData(a)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func NotificationCenterData() {
        let dataToSend = passDataTextView.text.description
        // phát hành thông báo
        NotificationCenter.default.post(name: .didReceiveData, object: nil, userInfo: ["data": dataToSend])
        navigationController?.popViewController(animated: true)
    }

    @IBAction func ClosuresData(_ sender: Any) {
        // Ví dụ: Dữ liệu bạn muốn gửi ngược lại
        let dataToSend = passDataTextView.text.description
        // Gọi closure để gửi dữ liệu
        completionHandler?("\(dataToSend)")
        navigationController?.popViewController(animated: true)
    }
    
}
