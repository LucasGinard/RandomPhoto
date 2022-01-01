//
//  ViewController.swift
//  RandomPhoto
//
//  Created by LucasG on 2022-01-01.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Generate Random", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        getRandomPhoto()
        view.addSubview(button)
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.width-60,
            height: 55)
    }
    
    func getRandomPhoto(){
        let urlPhoto = "https://source.unsplash.com/random/600x600"
        let urlRandom = URL(string: urlPhoto)!
        guard let data = try? Data(contentsOf: urlRandom) else{
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    @objc func onClickButton(){
        getRandomPhoto()
    }


}

