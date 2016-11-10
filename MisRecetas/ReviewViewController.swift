//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by Victor Guillen on 9/11/16.
//  Copyright © 2016 Victor Guillen. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var ratingStackView: UIStackView!
    
    @IBOutlet var firstButton: UIButton!
    
    @IBOutlet var secondButton: UIButton!
    
    @IBOutlet var thirdButton: UIButton!
    
    var ratingSelected : String?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Creamos efecto blur para la imagen de fondo
        
        let blurEffect = UIBlurEffect(style: .dark)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(blurEffectView)

        //Añadimos animacion a la stackview (1º) Reduciendo de tamaño a 0 desaparace y luego lo hacemos aparecer
        
        //ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        //Ahora cambiamos la animacion de toda la stackview por la de cada boton individualmente
        
        self.firstButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.secondButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.thirdButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        // Moviendola hacia abajo y luego haciendola subir
        
        //ratingStackView.transform = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //Ahora cambiamos la animacion de toda la stackview por la de cada boton individualmente
        
        self.firstButton.transform = CGAffineTransform(translationX: 0.0, y: 500.0)
        self.secondButton.transform = CGAffineTransform(translationX: 0.0, y: 500.0)
        self.thirdButton.transform = CGAffineTransform(translationX: 0.0, y: 500.0)
        
    }
    
    //Añadimos animacion a la stackview (2º)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations:{
            
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
            
            , completion: nil)*/
        
        //Otra animacion, damping(stilo rebote)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
            
            
            , completion: nil)

        
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
                
            self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
            
            
            , completion: nil)

            
            UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
                
                self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        
        }
            
            
            , completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Vamos a crear la valoracion uniendo los 3 botones a una misma IBaction y creando el siguiente switch y la var ratingSelected
    
    @IBAction func ratingPressed(_ sender: UIButton) {
    
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default: 
            break
        }
        
        //Recordar ponerle el indentifier al unwind segue en el storyboard
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
