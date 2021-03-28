//
//  ViewController.swift
//  ColorPickerController with Delegate
//
//  Created by Admin on 3/29/21.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        style()
        layout()
    }

    func style() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Color", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapSelectColor), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func didTapSelectColor() {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        self.present(colorPickerVC, animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

