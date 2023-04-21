//
//  LazyImageView.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
import UIKit

class LazyImageView : UIImageView{
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(imageUrl : URL, placeholdetImage : String){
        self.image = UIImage(named: "placeholderImage")
        
        if let cachedImage = self.imageCache.object(forKey: imageUrl as AnyObject)
        {
            debugPrint("image loaded from cache for =\(imageUrl)")
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageUrl){
                debugPrint("image downloaded from server...")
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self?.imageCache.setObject(image, forKey: imageUrl as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
