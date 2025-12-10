//
//  ViewController.swift
//  Demo
//
//  Created by Dmitriy on 18.11.2025.
//

import UIKit
import Utils

class ViewController: UIViewController {
    
    let horisontalScroll = HorizontalScrollView()()
    let verticalScroll = VerticalScrollView()
    
    let lable1 = { let label = UILabel()
        label.text = "Label 1"
        label.font = .systemFont(ofSize: 68)
        label.backgroundColor = .red
        return label
    }()
    
    let lable2 = { let label = UILabel()
        label.text = "Label 2"
        label.font = .systemFont(ofSize: 38)
        label.backgroundColor = .green
        return label
    }()
    let lable3 = { let label = UILabel()
        label.text = "Label 3"
        label.font = .systemFont(ofSize: 38)
        label.backgroundColor = .gray
        return label
    }()
    let lable4 = { let label = UILabel()
        label.text = "Label 4"
        label.font = .systemFont(ofSize: 38)
        label.backgroundColor = .yellow
        return label
    }()
    
    let lable5 = { let label = UILabel()
        label.text = "Label 5"
        label.font = .systemFont(ofSize: 68)
        label.backgroundColor = .red
        return label
    }()
    
    let lable6 = { let label = UILabel()
        label.text = "Label 6"
        label.font = .systemFont(ofSize: 38)
        label.backgroundColor = .green
        return label
    }()
    let lable7 = { let label = UILabel()
        label.text = "Label 7"
        label.font = .systemFont(ofSize: 38)
        label.backgroundColor = .gray
        return label
    }()
    let lable8 = { let label = UILabel()
        label.text = "Label 8"
        label.font = .systemFont(ofSize: 38)
        label.backgroundColor = .yellow
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [horisontalScroll, verticalScroll].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [lable1, lable2, lable3, lable4].forEach {
            horisontalScroll.addArrangedView($0)
        }
        horisontalScroll.backgroundColor = .black
        horisontalScroll.setAlignment(.bottom)
        horisontalScroll.setPadding(left: 10)
        horisontalScroll.setSpacing(20)
        
        NSLayoutConstraint.activate([
            horisontalScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horisontalScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horisontalScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        verticalScroll.backgroundColor = .blue
        verticalScroll.setAlignment(.center)
        verticalScroll.setPadding(top: 10)
        verticalScroll.setSpacing(25)
        
        [lable5, lable6, lable7, lable8].forEach {
            verticalScroll.addArrangedView($0)
        }
        
        NSLayoutConstraint.activate([
            verticalScroll.topAnchor.constraint(equalTo: horisontalScroll.bottomAnchor),
            verticalScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        // Do any additional setup after loading the view.
    }
}

