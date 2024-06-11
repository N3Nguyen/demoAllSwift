//
//  ViewControllerB.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 05/06/2024.
//

import UIKit

class ViewControllerB: UIViewController {

    @IBOutlet weak var saveDataTextView: UITextView!
    var data: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        saveDataTextView.text = data
    }

    @IBAction func backA(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
