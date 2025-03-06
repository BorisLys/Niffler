//
//  SharedAccessibilityIdentifier.swift
//  Niffler
//
//  Created by Станислав Карпенко on 06.12.2023.
//

import Foundation

public enum LoginViewIDs: String {
    case logInText = "logInText"
    case usernameText = "usernameText"
    case userNameTextField = "userNameTextField"
    case passwordTextField = "passwordTextField"
    case loginButton = "loginButton"
    case loginError = "loginError"
}

public enum SpendsViewIDs: String {
    case spendsList = "spendsList"
    case addSpendButton = "addSpendButton"
}

public enum StatisticViewIDs: String {
    case statisticText = "statisticText"
    
}

public enum SignUpViewIDs: String {
    case userNameTextField = "userNameTextField"
    case passwordTextField = "passwordTextField"
    case confirmPasswordTextField = "confirmPasswordTextField"
    case signUpButton = "signUpButton"
}

public enum SpendCellIDs: String {
    case toggle = "toggle"
    case spendDescriptionText = "spendDescriptionText"
    case spendCategoryNameText = "spendCategortNameText"
    case spendAmountText = "spendAmountText"
    case spendDateDescriptionText = "spendDateDescriptionText"
}
