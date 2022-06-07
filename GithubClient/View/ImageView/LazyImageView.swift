//
//  LazyImageView.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

import UIKit

class LazyImageView: UIImageView {

    let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(fromUrl imageUrl: URL, placeholderImage: String) {
        image = UIImage(named: placeholderImage)
        
        if let image = imageCache.object(forKey: imageUrl as AnyObject) {
            self.image = image
            return
        }

        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.imageCache.setObject(image, forKey: imageUrl as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
