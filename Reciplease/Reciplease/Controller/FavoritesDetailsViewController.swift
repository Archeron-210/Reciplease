//
//  FavoritesDetailsViewController.swift
//  Reciplease
//
//  Created by Archeron on 03/01/2022.
//

import UIKit

class FavoritesDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var recipePicture: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ingredientListTextView: UITextView!
    @IBOutlet weak var getDirectionButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var likesAndTimeStackView: UIStackView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterfaceAspect()
    }

    // MARK: - Actions
    @IBAction func getDirectionsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        updateFavoriteIcon()
    }

    // MARK: - Private functions

    private func updateFavoriteIcon() {
        if !favoriteButton.isSelected {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }

    // MARK: - UI Aspect

    private func setInterfaceAspect() {
        getDirectionButton.layer.cornerRadius = 10.0
        likesAndTimeStackView.layer.cornerRadius = 5.0
        likesAndTimeStackView.layer.borderWidth = 0.5
        likesAndTimeStackView.layer.borderColor = UIColor.white.cgColor
    }
}
