//
//  Representables.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import UIKit

protocol NavigatorPresentable {
    var navigationController: UINavigationController { get }
}

protocol TabBarRepresentable {
    var icon: UIImage { get }
    var title: String { get }
}
