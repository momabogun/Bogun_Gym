//
//  EditProfilePicSheet.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI
import PhotosUI

struct EditProfilePicSheet: View {
    @State private var showCamera = false
    @State var image: UIImage?
    @StateObject var photoViewModel = PhotoPickerViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    @Binding var isShown: Bool
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack{
                        Button("Take Photo"){
                            showCamera.toggle()
                        }.fullScreenCover(isPresented: self.$showCamera) {
                            accessCameraView(selectedImage: self.$image)
                            
                        }
                        Spacer()
                        Image(systemName: "camera")
                    }.foregroundStyle(.white)
                    
                    HStack{
                        PhotosPicker(selection: $photoViewModel.imageSelection, matching: .images) {
                            HStack{
                                Text("Choose Photo")
                                Spacer()
                                Image(systemName: "photo")
                            }.foregroundStyle(.white)
                        }
                        
                        
                        
                    }
                    
                    HStack{
                        Button("Delete Photo"){
                            authViewModel.user?.profilePic = nil
                            isShown.toggle()
                        }
                        Spacer()
                        Image(systemName:"trash")
                    }.foregroundStyle(.red)
                }
            }
                .navigationTitle("Edit Profile Picture").toolbar{
                    ToolbarItem{
                        Button("", systemImage: "xmark.circle.fill") {
                            isShown.toggle()
                        }
                    }
                }
            
        }
    }
    
    struct accessCameraView: UIViewControllerRepresentable {
        
        @Binding var selectedImage: UIImage?
        @Environment(\.presentationMode) var isPresented
        
        func makeUIViewController(context: Context) -> UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            imagePicker.delegate = context.coordinator
            return imagePicker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
            
        }

        func makeCoordinator() -> Coordinator {
            return Coordinator(picker: self)
        }
    }

    // Coordinator will help to preview the selected image in the View.
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: accessCameraView
        private var photoViewModel = PhotoPickerViewModel()
        init(picker: accessCameraView) {
            self.picker = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            self.picker.selectedImage = selectedImage
            photoViewModel.uploadPic(withImage: selectedImage)
            self.picker.isPresented.wrappedValue.dismiss()
        }
    }

}


