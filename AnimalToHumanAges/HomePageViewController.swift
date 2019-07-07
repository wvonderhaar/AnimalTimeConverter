//
//  HomePageViewController.swift
//  AnimalToHumanAges
//
//  Created by Walker Vonder Haar on 7/4/19.
//  Copyright © 2019 Walker Vonder Haar. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!

    var imageNumber = 0
    var numOfImages = 5


    override func viewDidLoad() {
        super.viewDidLoad()
        animalImage.image = UIImage(named: "animal0")


    }

    func subtitleTextChange () {
        if animalImage.image == UIImage(named: "animal0") {
            subtitleLabel.text = "How old really is my dog?"
        } else if animalImage.image == UIImage(named: "animal1") {
            subtitleLabel.text = "How old really is my cat?"
        } else if animalImage.image == UIImage(named: "animal2") {
            subtitleLabel.text = "How old really is my hamster?"
        } else if animalImage.image == UIImage(named: "animal3") {
            subtitleLabel.text = "How old really is my horse?"
        } else if animalImage.image == UIImage(named: "animal4") {
            subtitleLabel.text = "How old really is my laptop?"
        } else if animalImage.image == UIImage(named: "animal5") {
            subtitleLabel.text = "How old really is my pig?"
        } else {
            print("this image should not exist")
        }
    }

    @IBAction func animalTapped(_ sender: UITapGestureRecognizer) {
        imageNumber += 1
        if imageNumber == numOfImages {
            imageNumber = 0
        }
        animalImage.image = UIImage(named: "animal\(imageNumber)")
        subtitleTextChange()

    }


}
