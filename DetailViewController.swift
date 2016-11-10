//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by Victor Guillen on 8/11/16.
//  Copyright © 2016 Victor Guillen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    
    @IBOutlet var RecipeImageView: UIImageView!
    
    @IBOutlet var tableView: UITableView!
   
    //Para que nos cambie el icono en el detailViewController cuando se pulse uno de los botones de rating en el reviewViewController creamos esta IBoutlet
    
    @IBOutlet var ratingButton: UIButton!
    
  
    
    var recipe : Recipe!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Ponemos el titulo del boton igual al nombre de la receta
        self.title = recipe.name
        
        // Le decimos que muestre la imagen de nuestra receta
        self.RecipeImageView.image = self.recipe.image
       
        //Cambiamos el color de las celdas
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.3)
       
        //Con este metodo, desapareceran las celdas que esten vacias al final de la tabla
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //Cambiamos el color de los separadores
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        //Para celdas dinamicas que se autoajusten (44.0 es el tamaño estandar, pero le decimos un aproximado)
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let image = UIImage(named: self.recipe.rating)
        self.ratingButton.setImage(image, for: .normal)
        
        
    }
    
    //Creamos una funcion viewwillappear para que la barra de navegacion vuelva a aparecer cada vez que se carga la vista
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    //Ocultamos la barra de estado
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Como la accion del unwind segue se realiza aqui, hacemos lo siguiente para que se nos camie el icono segun la seleccion del rating

    @IBAction func close(segue: UIStoryboardSegue) {
        
        if let reviewVC = segue.source as? ReviewViewController {
            
            if let rating = reviewVC.ratingSelected {
                self.recipe.rating = rating
                let image = UIImage(named: self.recipe.rating)
                self.ratingButton.setImage(image, for: .normal)
                
            }
            
            
            
        }
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

extension DetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            //Cambiamos de 3 a 2 para corregir el fallo de cambiar la var isFavourite
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailTableViewCell
        //Eliminamos el color de fondo de las celdas para que se vea el color que hemos cambiado antes
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "Tiempo"
                cell.valueLabel.text = "\(self.recipe.time!) min"
                
            //Nos lo cargamos para corregir el fallo de cambiar la var isFavourite
            /*case 2:
                cell.keyLabel.text = "Favorita"
                if self.recipe.isFavourite {
                    cell.valueLabel.text = "Si"
                } else {
                    cell.valueLabel.text = "No"
                }*/
            default:
                break
            }

        case 1:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Ingredientes:"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Pasos:"
            } else {
                cell.keyLabel.text = "" 
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
            
        default:
            break
        }
        
        return cell
    }
    
    //Damos un titulo a cada seccion
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes:"
        case 2:
            title = "Pasos"
        default:
            break
        }
        
        return title
    }
    
    
}



extension DetailViewController : UITableViewDelegate {
    
    
}
