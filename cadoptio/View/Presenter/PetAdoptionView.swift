//
//  PetAdoptionView.swift
//  cadoptio
//
//  Created by David Gunawan on 22/03/24.
//

import SwiftUI
import SwiftData

struct PetAdoptionView: View {
    
    @State private var isFilterViewPresented = false
    @State private var isAddNewPetViewPresented = false
    @Environment(\.modelContext) var context
    
    @Query var pets: [PetModel] 
    
    var body: some View {
        NavigationStack {
            List(pets){ pet in PetCardView(pet: pet)
//                PetCardView(pet: PetModel(
//                    name: "Leppy",
//                    breed: "Domestic",
//                    weight: "3 kg",
//                    gender: "Female",
//                    imageName: "Leppy")
//                )
//                PetCardView(pet: PetModel(
//                    name: "Sky",
//                    breed: "Ragdoll",
//                    weight: "5 kg",
//                    gender: "Male",
//                    imageName: "Sky")
//                )
                //Text("number of pet \(pets.count)")
            }
            .listStyle(.plain)
            .navigationTitle("My Pet")
            .toolbar {
                Button(action: {
                    isAddNewPetViewPresented = true
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                }
                Button(action: {
                    isFilterViewPresented = true
                }) {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .foregroundColor(.orange)
                }
            }
            .sheet(isPresented: $isFilterViewPresented) {
                FilterView()
            }
            .sheet(isPresented: $isAddNewPetViewPresented) {
                AddNewPetView()
            }
        }
    }
    
    func editPet(){
        let pet1 = pets[0]
        pet1.name = "Koko"
        
        try? context.save()
    }
}

struct PetAdoptionView_Previews: PreviewProvider {
    static var previews: some View {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try! ModelContainer(for: PetModel.self, configurations: config)
        
        PetAdoptionView()
    }
}
