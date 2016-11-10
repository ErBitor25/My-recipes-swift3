//
//  ViewController.swift
//  MisRecetas
//
//  Created by Victor Guillen on 7/11/16.
//  Copyright © 2016 Victor Guillen. All rights reserved.
//
import Foundation

import UIKit

// Hay que cambiar el UIViewController por UITableViewController

class ViewController: UITableViewController {
    
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Quitamos el titulo del boton de atras
          navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
       

        
        //Recetas de la app
        
        var recipe = Recipe(name: "Tortilla de patatas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients: ["Patatas", "Huevos", "Cebolla"],
                            steps: ["Pelar las patatas y la cebolla",
                                    "Cortar las patatas y la cebolla y sofreir",
                                    "Batir los huevos y echarlos durante 1 minuto a la sarten con el resto"])
        //añadimos la receta al array
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita",
                        image: #imageLiteral(resourceName: "pizzamargarita"),
                        time: 60,
                        ingredients: ["Harina", "Levadura", "Aceite", "Sal", "Salsa de tomate", "Queso"],
                        steps: ["Hacemos la masa con harina, levadura, aceite y sal",
                                "Dejamos reposar la masa 30 minutos",
                                "Extendemos al masa encima de una bandeja y añadimos el resto de ingredientes encima",
                                "Hornear durante 12 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso",
                        image: #imageLiteral(resourceName: "cheseeburger"),
                        time: 10,
                        ingredients: ["Pan de hamburguesa", "Lechuga", "Queso", "Tomate", "Carne"],
                        steps: ["Freir la carne al gusto",
                                "Montar la hamburguesa con sus ingredientes entre los panes"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada Cesar",
                        image: #imageLiteral(resourceName: "caesarsalad"),
                        time: 15,
                        ingredients: ["Lechuga", "Tomate", "Cebolla", "Salsa Cesar", "Pollo"],
                        steps: ["Limpiar todas las verduras y trocearlas",
                                "freir el pollo al gusto",
                                "Juntar todos los ingredientes en una ensaladera y servir con salsa Cesar por encima"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Batido de fresa",
                        image: #imageLiteral(resourceName: "Batidofresa"),
                        time: 7,
                        ingredients: ["Fresas", "Leche", "Azucar"],
                        steps: ["Añadir todos los ingredientes a la batidora de vaso",
                                "Enchufar la batidora",
                                "Encender batidora durante el tiempo necesario a gusto del consumidor"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Espaguetti Pesto",
                        image: #imageLiteral(resourceName: "Spaguetispesto"),
                        time: 15,
                        ingredients: ["Espaguetis o tallarines", "Sal", "Aceite", "Salsa Pesto"],
                        steps: ["Hervir agua con un poco de aceite y sal",
                                "Añadir los espaguetis y cocer durante 9 minutos, remover de vez en cuando",
                                "Cortar la coccion con agua fria, escurrrir",
                                "Añadir salsa pesto"])
        recipes.append(recipe)


    }
     //Creamos una funcion viewwillappear para que la barra de navegacion desaparezca al hacer swipe
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Ocultamos barra de estado
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    //MARK: - UITableViewDataSource
    
    //numero de columnas o secciones de la tabla
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas de la table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    //Damos la informacion que queremos que muestren las celdas de la tabla
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLable.text = "Ingredientes: \(recipe.ingredients.count)"
        
       //Un if para que ponga o no el checkmark si es favorito
        
        //Nos lo cargamos para corregir el fallo de cambiar la var isFavourite
        
        /*if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        
        //Forma en codigo para hacer las imagenes redondas, nosotros en este caso lo hemos hecho con el storyboard
        //cell.thumbnailImageView.layer.cornerRadius = 45.0
        //cell.thumbnailImageView.clipsToBounds = true
        
        
        return cell
        
    }
    //Sacar boton de borrar al hacer swype y eliminar la receta al pulsarlo (Esta funcion es solo para el boton borrar tipico en rojo nativo de iOS)(en este caso no seria necesario, puesto que hemos creado otro mas abajo)
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //if para decirle que si se pulsa borrar borre esa receta del array
        
        if editingStyle == .delete {
            
            self.recipes.remove(at: indexPath.row)
        }
        
        // Que borre la receta de la tabla en la vista con un efecto fade
         
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    //Sacar otros botones al hacer swype
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Compartir
        
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            //Lo que queremos que se comparta 
            //Texto
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la app del curso"
            
            //Imagen
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
        }
        
        //Cambio de color del boton
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    
        
        //Borrar
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)

            
        }
        
        //Cambio de color del boton
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
       
        //Lo que devuelve la funcion
        
        return [shareAction, deleteAction]
        
        
    }
    
    
    //MARK: UITableViewDelegate
    
    // Añadimos una alerta al pulsar en la celda, con dos botones, y un checkmark al darle a me gusta
    
   /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favouriteActionTitle = "Me gusta"
        var favouriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite {
            favouriteActionTitle = "Ya no me gusta"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        
        alertController.addAction(favouriteAction)
            
            
        self.present(alertController, animated: true, completion: nil)
        
    }*/

    //MARK: Configuramos el segue showRecipeDetail
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let selectedRecipe = self.recipes[indexPath.row]
                
                let destinationViewController = segue.destination as! DetailViewController
            
                
                destinationViewController.recipe = selectedRecipe
            }
        }
    }

}
