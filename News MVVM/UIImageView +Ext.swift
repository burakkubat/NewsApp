//
//  UIImageView +Ext.swift
//  News MVVM
//
//  Created by Burak Kubat on 3.04.2023.
//

import Foundation
import UIKit

extension UIImageView {
    func getImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        } .resume()
    }
}
