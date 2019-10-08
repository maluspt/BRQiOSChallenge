//
//  Band.swift
//  challange01
//
//  Created by Maria Luiza Carvalho Sperotto on 05/10/19.
//  Copyright © 2019 Maria Luiza Carvalho Sperotto. All rights reserved.
//
import UIKit


class Band {
    
    var image: UIImage
    var image2: UIImage
    var name: String
    var description: String
    
    
    init(name: String, description: String, imageName: String, imageName2: String) {
        self.name = name
        self.description = description
        self.image = UIImage(named: imageName)!
        self.image2 = UIImage(named: imageName2)!
    
}
    
    class func getBands() -> [Band] {
        var bands =  [Band]()
    
        bands.append(Band(name: "The Beatles", description: "The Beatles foi uma banda de rock britânica, formada em Liverpool em 1960. É o grupo musical que mais vendeu na história da música. Segundo a EMI, em estimativa de 2001, mais de um bilhão de discos.", imageName: "band2", imageName2: "band2.1"))
        bands.append(Band(name: "Paramore", description: "Paramore é uma banda americana de rock formada em Franklin, Tennessee no ano de 2004. A banda já lançou cinco álbuns de estúdio: All We Know Is Falling, Riot!, Brand New Eyes, Paramore e After Laughter. ", imageName: "band1", imageName2: "band1.1"))
        bands.append(Band(name: "The Doors", description: "The Doors foi uma banda de rock psicodélico norte-americana formada em 1965 em Los Angeles, na Califórnia. O grupo era composto por Jim Morrison, Ray Manzarek, Robby Krieger e John Densmore", imageName: "band3", imageName2: "band3.1"))
        bands.append(Band(name: "System of A Down", description: "System of a Down é uma banda de metal armeno-americana formada em Glendale, Califórnia em 1994. O grupo é conhecido pelas visões políticas e sociais que inserem nas letras de suas canções.", imageName: "band4", imageName2: "band4.1"))
        bands.append(Band(name: "Led Zeppelin", description: "Led Zeppelin foi uma banda britânica de rock formada em Londres, em 1968. Seu som pesado e violento de guitarra, enraizado no blues e música psicodélica, é frequentemente reconhecido como um dos fundadores do heavy metal.", imageName: "band5", imageName2: "band5.1"))
        return bands
    }
    
    
    
   
}


