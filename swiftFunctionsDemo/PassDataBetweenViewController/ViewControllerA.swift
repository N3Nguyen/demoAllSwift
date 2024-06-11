//
//  ViewControllerA.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 05/06/2024.
//

import UIKit

class ViewControllerA: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var dataPassTextView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var getDataNotiButton: UIButton!
    @IBOutlet weak var getDataClosureButton: UIButton!
    
    var gradientLayer: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .didReceiveData, object: nil)
//        customeButton(button: addButton)
        
        // Sử dụng lớp AnimatedBackgroundView cho background
        let animatedBackgroundView = AnimatedBackgroundView(frame: view.bounds)
        view.insertSubview(animatedBackgroundView, at: 0)
        
        addButton.applyAnimatedButtonStyle()
        getDataNotiButton.applyAnimatedButtonStyle()
        getDataClosureButton.applyAnimatedButtonStyle()
    }
    
    //Truyền data sử dụng Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showViewControllerBSegue" {
            if let destinationVC = segue.destination as? ViewControllerB {
                destinationVC.data = dataLabel.text
            }
        }
    }
    
    func egg() {
        //        performSegue(withIdentifier: "showViewControllerBSegue", sender: self)
    }
    
    @objc func handleNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo, let data = userInfo["data"] as? String {
            dataPassTextView.text = data
        }
    }
    
    deinit {
        // Hủy đăng ký nhận thông báo khi view controller bị giải phóng
        NotificationCenter.default.removeObserver(self, name: .didReceiveData, object: nil)
    }
    
    func passDataBasic() {
        let a = dataPassTextView.text.description
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerC = storyboard.instantiateViewController(withIdentifier: "showDelagate") as? ViewControllerDelegate {
            // Truyền dữ liệu
            viewControllerC.dataPass = a
            navigationController?.pushViewController(viewControllerC, animated: true)
        }
    }
    
    func passDataDelegate() {
        let a = dataPassTextView.text.description
        // Khởi tạo ViewControllerDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerDelegate = storyboard.instantiateViewController(withIdentifier: "showDelagate") as? ViewControllerDelegate {
            viewControllerDelegate.passDataTextView.text = a
            // Thiết lập ViewControllerA làm delegate của ViewControllerDelegate
            viewControllerDelegate.delegate = self
            // Hiển thị ViewControllerDelegate
            navigationController?.pushViewController(viewControllerDelegate, animated: true)
        }
    }
    
    func passDataNotifi() {
        // Khởi tạo ViewControllerDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerDelegate = storyboard.instantiateViewController(withIdentifier: "showDelagate") as? ViewControllerDelegate {
            // phát hành thông báo
            NotificationCenter.default.post(name: .didReceiveData, object: nil, userInfo: ["data": dataPassTextView.text])
            // Hiển thị ViewControllerDelegate
            navigationController?.pushViewController(viewControllerDelegate, animated: true)
        }
    }
    
    func passDataClosures() {
        // Khởi tạo ViewControllerDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerDelegate = storyboard.instantiateViewController(withIdentifier: "showDelagate") as? ViewControllerDelegate {
            // Thiết lập closure
            viewControllerDelegate.completionHandler = { [weak self] data in
                self?.dataPassTextView.text = data
            }
            // Hiển thị ViewControllerDelegate
            navigationController?.pushViewController(viewControllerDelegate, animated: true)
        }
    }
    
    @IBAction func addPassData(_ sender: Any) {
        passDataBasic()
//        passDataDelegate()
        UIView.animate(withDuration: 0.1, animations: {
            self.addButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.addButton.transform = CGAffineTransform.identity
            }
        }
//        Thread.sleep(forTimeInterval: 1)
    }
    @IBAction func getDataNoti(_ sender: Any) {
        passDataNotifi()
    }
    @IBAction func getDataClosure(_ sender: Any) {
        passDataClosures()
    }
    
}
extension ViewControllerA: passDataDelegate{
    func didReceiveData(_ data: String?) {
        dataPassTextView.text = data
    }
}

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
}
