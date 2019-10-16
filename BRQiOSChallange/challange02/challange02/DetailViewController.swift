//
//  DetailViewController.swift
//  challange02
//
//  Created by Maria Luiza Carvalho Sperotto on 15/10/19.
//  Copyright © 2019 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    var movie: Movie?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = "https://image.tmdb.org/t/p/w500"
        guard let poster_path = movie?.poster_path else { return  }
        let full_path = path + poster_path
        
        
        let imageURL: NSURL? = NSURL(string: full_path)

        if let url = imageURL {
            movieImage.sd_setImage(with: url as URL)
        }
    
        movieNameLabel.text = movie?.title
        movieReleaseDate.text = "Lançamento: \(movie?.release_date ?? "Data não informada")"
        movieDescription.text = movie?.overview
        
        
        
            
        }
        
        

    }
    
    
    
    
    



