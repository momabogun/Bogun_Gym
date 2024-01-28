//
//  PhotoPickerViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 27.01.24.
//

import Foundation
import UIKit
import _PhotosUI_SwiftUI
import Firebase
import FirebaseStorage
class PhotoPickerViewModel: ObservableObject{
    
    private let firebaseManager = FirebaseManager.shared
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet{
            setImage(from: imageSelection)
        }
    }
    private func setImage(from selection: PhotosPickerItem?){
        guard let selection else{
            return
        }
        Task{
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data){
                    self.uploadPic(withImage: uiImage)
                    return
                }
            }
        }
    }
    
    
    
    
    private func uploadPic(withImage : UIImage){
        
        guard let imageData = withImage.jpegData(compressionQuality: 0.5) else {return}
        let storageRef = firebaseManager.storage.reference()
        let thisUserPhotoStorageRef = storageRef.child("images").child(firebaseManager.userId ?? "").child("profilePic")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        thisUserPhotoStorageRef.putData(imageData, metadata: metadata) { (metadata,error) in
            guard let metadata = metadata else {
                print("Error while uploading")
                return
            }
            
            thisUserPhotoStorageRef.downloadURL { (url, error) in
                print(metadata.size)
                thisUserPhotoStorageRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        print("Error occured after uploading")
                        return
                    }
                    let changeRequest = self.firebaseManager.auth.currentUser?.createProfileChangeRequest()
                    changeRequest?.photoURL = downloadURL
                    changeRequest?.commitChanges{ (error) in
                        print("error")
                        
                    }
                    
                    let fullURL = downloadURL.absoluteString
                    let data = [
                        "profilePic" : fullURL
                    ]
                    
                    self.firebaseManager.database.collection("Profiles").document(self.firebaseManager.userId ?? "").setData(data, merge: true){ error in
                        if let error {
                            print("Profile not updated", error.localizedDescription)
                            return
                            
                        }
                        print("Profile Updated")
                        
                    }

                    
                        
                    }
                }
            
            
                
            }
        
                
        
       
        
            
            
        }
    
    
    
        
    }

