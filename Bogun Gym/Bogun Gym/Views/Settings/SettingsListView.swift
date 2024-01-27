//
//  SettingsListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 25.01.24.
//

import SwiftUI

struct SettingsListView: View {
    @StateObject var myWorkoutViewModel = MyWorkoutViewModel()
    @StateObject var storeViewModel = StoreViewModel()
    @EnvironmentObject var authViewModel :AuthViewModel
    @State var darkMode: Bool = false
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    NavigationLink(destination: EditProfileView(user: authViewModel.user!).environmentObject(authViewModel)) {
                        HStack{
                            if authViewModel.user!.profilePic == nil {
                                Image("profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(50)
                            } else{
                                AsyncImage(url: URL(string: authViewModel.user?.profilePic ?? "")) { image in
                                    image
                                        .resizable()
                                        
                                        
                                }placeholder: {
                                    Image("profile")
                                        .resizable()
                                        
                                }
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .cornerRadius(50)

                            }
                            VStack(alignment: .leading){
                                Text(authViewModel.user?.name ?? "")
                                    .bold()
                                Text(authViewModel.user?.about ?? "")
                            }
                        }
                    }
                    
                    
                }
                
                Section{
                    NavigationLink(destination: AccountView()) {
                        HStack{
                            Image(systemName: SettingsItem.account.image)
                                
                            Text(SettingsItem.account.title)
                        }
                    }
                    NavigationLink(destination: FitnessCalculatorView()) {
                        HStack{
                            Image(systemName: SettingsItem.calculator.image)
                                
                            Text(SettingsItem.calculator.title)
                        }
                        
                    }
                    
                }
                
                Section{
                    NavigationLink(destination: HelpView()) {
                        HStack{
                            Image(systemName: SettingsItem.help.image)
                                
                            Text(SettingsItem.help.title)
                        }
                        
                    }
                    ShareLink(item: "https://bogungym.com") {
                        HStack{
                            Image(systemName: SettingsItem.share.image)
                            Text(SettingsItem.share.title)
                        }
                    }.foregroundStyle(.primary)
                }
                Section{
                    Button("Log Out"){
                        myWorkoutViewModel.removeListener()
                        storeViewModel.removeListener()
                        authViewModel.logout()
                    }
                }
            }.navigationTitle("Profile").navigationBarTitleDisplayMode(.inline)
            
                
            }
        }
                
        
    }


#Preview {
    SettingsListView()
}
