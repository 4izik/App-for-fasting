//
//  AddWaterViewController.swift
//  Fasts
//
//  Created by Настя on 07.02.2022.
//

import UIKit

class AddWaterViewController: UIViewController {
    let addwaterView = AddWaterView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    private func setupUI() {
        view.addSubview(addwaterView)
        addwaterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addwaterView.widthAnchor.constraint(equalTo: view.widthAnchor),
            addwaterView.heightAnchor.constraint(equalTo: view.heightAnchor),
            addwaterView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        addwaterView.didTapClose = {
            self.dismiss(animated: true, completion: nil)
        }
        
    }

}
