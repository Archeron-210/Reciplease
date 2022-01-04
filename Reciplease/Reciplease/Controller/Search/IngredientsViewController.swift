//
//  IngredientsViewController.swift
//  Reciplease
//
//  Created by Archeron on 29/12/2021.
//

import UIKit

class IngredientsViewController: UIViewController {


    // MARK: - Outlets
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var ingredientListTextView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!

    // MARK: - Properties

    private var ingredientList: [String] = []

    private var ingredientListFormated: String {
        "- " + ingredientList.joined(separator: "\n- ")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonsAspect()
    }

    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let ingredient = ingredientTextField.text else {
            return
        }
        addIngredientToList(ingredient)
        updateIngredientListTextView()
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clearIngredientList()
    }

    @IBAction func searchButtonTapped(_ sender: Any) {
        getRecipes()
    }

    // MARK: - Private functions
    private func addIngredientToList(_ ingredient: String) {
        ingredientList.append(ingredient)
    }

    private func updateIngredientListTextView() {
        ingredientListTextView.text = ingredientListFormated
    }

    private func clearIngredientList() {
        ingredientListTextView.text = ""

        ingredientList.removeAll()
    }

    private func getRecipes() {
        NetworkService.shared.getRecipes(ingredientList: ingredientList) {
            
        }
    }


    // MARK: - UI Aspect

    private func setButtonsAspect() {
        addButton.layer.cornerRadius = 10.0
        clearButton.layer.cornerRadius = 10.0
        searchButton.layer.cornerRadius = 10.0
    }
}


// MARK: - Keyboard Management
extension IngredientsViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ingredientTextField.resignFirstResponder()
        return true
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        ingredientTextField.resignFirstResponder()
    }
}



