//
//  FilterRow.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import SwiftUI

struct FilterRow: View {
    var vm : HomeViewModel
    
    @State private var startDate = Calendar.current.date(from: DateComponents(year: 2017, month: 1, day: 10)) ?? Date()
    @State private var endDate = Calendar.current.date(from: DateComponents(year: 2017, month: 1, day: 10)) ?? Date()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    DatePicker("Fecha inicio", selection: $startDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .onChange(of: startDate) { newStartDate, _ in
                            if newStartDate > endDate {
                                endDate = newStartDate
                            }
                        }
                   
                    DatePicker("Fecha Termine", selection: $endDate, in: validEndDateRange, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
            }
            
            Button {
                let startTime = vm.formatearFecha(startDate)
                let endTime = vm.formatearFecha(endDate)
                
                print("inicio \(startTime) termino\(endTime)")
               
                vm.getQuakes(startTime: startTime, endTime: endTime) 
            } label: {
                Text("Buscar")
                    .foregroundStyle(Color.white)
                    .frame(width: 100, height: 20)
            }
            .tint(.blue)
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(height: 150)
        .background(Color.white.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 5)
    }

    // Rango dinámico para la fecha de término
    private var validEndDateRange: ClosedRange<Date> {
        let calendar = Calendar.current
        _ = calendar.date(from: calendar.dateComponents([.year], from: startDate)) ?? startDate
        let endOfYear = calendar.date(from: DateComponents(year: calendar.component(.year, from: startDate), month: 12, day: 31)) ?? startDate
        return startDate...endOfYear
    }
}
