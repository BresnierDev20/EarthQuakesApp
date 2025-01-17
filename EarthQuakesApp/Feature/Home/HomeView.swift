//
//  HomeView.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import SwiftUI
import SwiftData
struct HomeView: View {
    @State var viewModel = HomeViewModel()
    @Query(sort: \User.userID, order: .forward) var items: [User]
   
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange, Color.black], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea(.all)

            if viewModel.isLoading {
                ProgressView("")
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.0)
            }
            
            VStack(spacing: 0) {
                navBar(title: "Queakes", onAction: {
                    viewModel.userDtaStore.deleteUserKey()
                    NavigationManager.setRootView(view: LoginView(), animated: true)
                })
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Filtro de Búsqueda")
                            .bold()
                            .foregroundStyle(.white)

                        FilterRow(vm: viewModel)
                         
                        Text("Resultado")
                            .bold()
                            .foregroundStyle(.white)
                        
                        if viewModel.eartQuakes.isEmpty && viewModel.isEmpty == true {
                            Text("No se encontraron registros de sismos.")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, minHeight: 200) // Centra el mensaje verticalmente
                        }else if viewModel.eartQuakes.isEmpty && viewModel.isError{
                            Text(viewModel.isMessageError)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, minHeight: 200)
                        } else {
                            ForEach(viewModel.eartQuakes) { index in
                                QuakesRow(quakesItem: index)
                                    .onTapGesture {
                                        NavigationManager.push(view: DetailView(quakesDT: index))
                                    }
                            }
                        }
                    }
                    .padding()
                }
                .task {
                    viewModel.getQuakes(startTime: "2017-02-01", endTime: "2017-02-02")
                }
            }
        }.navigationBarHidden(true)
    }
}
