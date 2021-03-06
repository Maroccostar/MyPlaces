//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by user on 09.02.2022.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()// Заменили все лини под ячейками

    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera",
                                       style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
                let photo = UIAlertAction(title: "Photo",
                                          style: .default) { _ in
                    self.chooseImagePicker(source: .photoLibrary)
                }
                    
                    let cancel = UIAlertAction(title: "Cancel",
                                               style: .cancel)
                    
                    actionSheet.addAction(camera)
                    actionSheet.addAction(photo)
                    actionSheet.addAction(cancel)
                    
                    present(actionSheet, animated: true)
                    
              
            
        } else {
            view.endEditing(true)
        }
    }

}

// MARK: Text field delegate

extension  NewPlaceViewController: UITextFieldDelegate {
    //Скрываем клавиатуру по нажатию на Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: Work with image
extension NewPlaceViewController {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
             let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
}
