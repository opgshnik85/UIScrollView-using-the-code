//
//  ViewController.swift
//  UIScrollView
//
//  Created by MacBook on 04.02.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var myScrollView = UIScrollView()
    var myImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let p = "Начинается прокрутка"
        print(p)
        print(scrollView.contentOffset.y)
        self.myScrollView.alpha = 0.50
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let p = "Вызывается после прокрутки"
        print(p)
        self.myScrollView.alpha = 1.0
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let p = "Гарантирует что вернет Альфу к 1"
        print(p)
        self.myScrollView.alpha = 1.0
    }
    func createScrollView() {
        //Создаем UIImageView
        let imageToLoad = UIImage(named: "iphone")
        //Передаем UIImageView фотографию
        myImageView = UIImageView(image: imageToLoad)
        //Растягваем UIScrollView по всему View
        myScrollView = UIScrollView(frame: self.view.bounds)
        //На UIScrollView добавляем UIImageView
        myScrollView.addSubview(myImageView)
        //У UIScrollView берем contentSize и добавляем на него UIImageView
        myScrollView.contentSize = self.myImageView.bounds.size
        //Подписываемся на Delegate
        myScrollView.delegate = self
        //Добавляем все на View
        self.view.addSubview(myScrollView)
    }

}

