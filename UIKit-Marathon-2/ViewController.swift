//
//  ViewController.swift
//  UIKit-Marathon-2
//
//  Created by work on 05.05.2023.
//

import UIKit

class ViewController: UIViewController {

    var firstButton: CustomButton!
    var secondButton: CustomButton!
    var thirdButton: CustomButton!
    lazy var animator = UIViewPropertyAnimator(duration: 0.15, curve: .easeInOut)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtonsAndConstraints()
        setupButtonTargets()
    }
    
    func setupButtonsAndConstraints() {
        firstButton = CustomButton()
        secondButton = CustomButton()
        thirdButton = CustomButton()
        
        view.addSubview(firstButton)
        firstButton.setTitle("first button", for: .normal)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  30).isActive = true
        
        view.addSubview(secondButton)
        secondButton.setTitle("second large button", for: .normal)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(thirdButton)
        thirdButton.setTitle("third", for: .normal)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10).isActive = true
    }
    

    func setupButtonTargets() {
        firstButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        firstButton.addTarget(self, action: #selector(buttonReleased(_:)), for: [.touchUpInside, .touchUpOutside])
        
        secondButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        secondButton.addTarget(self, action: #selector(buttonReleased(_:)), for: [.touchUpInside, .touchUpOutside])
        
        thirdButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        thirdButton.addTarget(self, action: #selector(buttonReleased(_:)), for: [.touchUpInside, .touchUpOutside])
        
        thirdButton.addTarget(nil, action: #selector(showModalVC), for: .touchUpInside)
    }
    
    @objc
    func buttonPressed(_ sender: UIButton) {
        animator.addAnimations {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        animator.startAnimation()
    }

    @objc
    func buttonReleased(_ sender: UIButton) {
        animator.addAnimations {
            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        animator.startAnimation()
    }


    @objc
    func showModalVC() {
        let modalViewController = UIViewController()
        modalViewController.view.backgroundColor = .systemBackground
        
        
        self.present(modalViewController, animated: true)
    }
    
}


class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var configuration: UIButton.Configuration = .filled()
        configuration.image = UIImage(systemName: "chevron.forward.square.fill")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        self.configuration = configuration
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

