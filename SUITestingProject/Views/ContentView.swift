//
//  ContentView.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/20/22.
//

import SwiftUI
import CombineForms
import Combine

struct ContentView: View {
    @State private var name = "Taylor"
    
    var body: some View {
//        VStack {
//            HStack(spacing: 0) {
//                HStack {
//                    Spacer()
//                    VStack {
//                        Spacer()
//                        Text("20")
//                            .font(.system(size: 14))
//                        Spacer()
//                    }
//                    .frame(height: 41)
//                    Spacer()
//                }
//                .padding(.vertical, 2)
//                .background(ReturnDate().fill(.purple))
//                .frame(width: 51.57, height: 49)
//                .cornerRadius(3)
//                
//                HStack {
//                    Spacer()
//                    VStack {
//                        Spacer()
//                        Text("20")
//                            .font(.system(size: 14))
//                        Spacer()
//                    }
//                    .frame(height: 41)
//                    Spacer()
//                }
//                .padding(.vertical, 2)
//                .background(ReturnDate().fill(.purple).rotationEffect(.degrees(180)))
//                .frame(width: 51.57, height: 49)
//                .cornerRadius(3)
//            }
//        }
        SeatsView(
                columnsName: ["A", "B", "C", "", "D", "E", "F"],
                sections: [.premium, .standard]
        )
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct TextFieldWithErrors: View {
    @ObservedObject var field: CombineFormField
    @State var mask: String?
    var onEditingChanged: (Bool) -> Void = { (editing) in }
    
    //Input view
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if mask == nil {
                TextField(field.label, text: $field.value, onEditingChanged: onEditingChanged)
                    .textFieldStyle(.roundedBorder)
            } else {
                MMMaskedTextField(unformattedText: $field.value,
                                  placeholder: field.label,
                                  textPattern: field.label)
                .setMask(mask ?? "")
                .textFieldStyle(.roundedBorder)
//                FormatTextField(
//                    unformattedText: $field.value,
//                    placeholder: field.label,
//                    textPattern: mask ?? ""
//                ).borderStyle(.roundedRect)
                    
            }
            Label(field.error, systemImage: "")
                .foregroundColor(Color.red)

        }
        .padding(20)
    }
}

struct DepartureDate: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width * 0.75, y: rect.maxY))
        
        /// Right bottom curve
        path.addArc(
            center: CGPoint(x: rect.maxX * 0.73, y: rect.maxY * 0.845),
            radius: rect.width * 0.153061,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 25),
            clockwise: true
        )
        path.addLine(to: CGPoint(x: rect.maxX * 0.98, y: rect.midY * 1.1))
        
        /// Right middle curve
        path.addArc(
            center: CGPoint(x: rect.maxX * 0.77, y: rect.midY),
            radius:  rect.width * 0.204082,
            startAngle: .degrees(0),
            endAngle: .degrees(-20),
            clockwise: true
        )
        
        path.addLine(to: CGPoint(x: rect.width * 0.89, y: rect.maxY * 0.17))
        
        /// Right top curve
        path.addArc(
            center: CGPoint(x: rect.maxX * 0.73, y: rect.maxY * 0.155),
            radius: rect.width * 0.153061,
            startAngle: Angle(degrees: -15),
            endAngle: Angle(degrees: 270),
            clockwise: true
        )
        
        return path
    }
}

struct ReturnDate: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width * 0.75, y: rect.maxY))

        /// Right bottom curve
        path.addArc(
            center: CGPoint(x: rect.maxX * 0.73, y: rect.maxY * 0.83),
            radius: rect.width * 0.153061,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 25),
            clockwise: true
        )
        path.addLine(to: CGPoint(x: rect.maxX * 0.98, y: rect.midY * 1.1))
        
        /// Right middle curve
        path.addArc(
            center: CGPoint(x: rect.maxX * 0.78, y: rect.midY),
            radius: rect.width * 0.204082,
            startAngle: .degrees(0),
            endAngle: .degrees(-20),
            clockwise: true
        )
        
        path.addLine(to: CGPoint(x: rect.width * 0.89, y: rect.maxY * 0.17))
        
        /// Right top curve
        path.addArc(
            center: CGPoint(x: rect.maxX * 0.73, y: rect.maxY * 0.17),
            radius: rect.width * 0.153061 ,
            startAngle: Angle(degrees: -15),
            endAngle: Angle(degrees: 270),
            clockwise: true
        )

        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView(
                columnsName: ["A", "B", "C", "", "D", "E", "F"],
                sections: [.premium, .standard]
        )
    }
}

struct SeatsView: View {
    @StateObject private var viewModel: SeatsViewModel
    
    init(columnsName: [String], sections: [SeatType]) {
        self._viewModel = StateObject(wrappedValue: SeatsViewModel(columns: columnsName, sections: sections))
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: viewModel.columns.count)) {
                        ForEach(viewModel.columns, id: \.self) { name in
                            HStack {
                                Text(name)
                            }
                        }
                    }
                }
                .padding(.vertical)
                .background(Color.gray)
                
                ForEach(Array(viewModel.sectionSeats.keys)) { section in
                    VStack {
                        HStack {
                            dividerLine(isVertical: false)
                            
                            Text(section.section)
                            
                            dividerLine(isVertical: false)
                        }
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: viewModel.columns.count)) {
                            if let seats = viewModel.sectionSeats[section] {
                                ForEach(Array(seats.enumerated()), id: \.element.id) { index, seat in
                                    HStack {
                                        if seat.isBlank {
                                            EmptyView()
                                        } else {
                                            Text(seat.name)
                                                .background(getSeatColor(for: seat))
                                        }
                                    }
                                    .onTapGesture {
                                        viewModel.selectSeat(seat, index: index)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.green)
        }
        .padding(.horizontal)
    }
    
    func dividerLine(isVertical: Bool) -> some View {
        let layout = isVertical ?
        AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        return layout { Divider() }
    }
    
    func getSeatColor(for seat: Seat) -> Color {
        guard !seat.isSelected else {
            return Color.white
        }
        
        switch seat.type {
        case .premium:
            return Color.yellow
        case .standard:
            return Color.purple
        case .moreSpace:
            return Color.orange
        case .comfort:
            return Color.blue
        case .hallway:
            return Color.clear
        }
    }
}

class SeatsViewModel: ObservableObject {
    @Published var sectionSeats: [SeatType: [Seat]] = [:]
    let columns: [String]
    
    init(columns: [String], sections: [SeatType]) {
        self.columns = columns
        var seatsCounter = 1
        
        
        
        for currentRow in 1...sections.count {
            var seats: [Seat] = []
            
            for column in 1...columns.count {
                let columnName = columns[column - 1]
                let seat = Seat(
                    id: seatsCounter,
                    type: columnName.isEmpty ? .hallway : sections[currentRow - 1],
                    name: "\(currentRow)\(columnName)"
                )
                seats.append(seat)
                
                seatsCounter += 1
            }
            
            sectionSeats.updateValue(seats, forKey: sections[currentRow - 1])
        }
        
//        let premiumSeats = [
//            Seat(id: 1, type: .premium, name: "1A"),
//            Seat(id: 2, type: .premium, name: "1B", isBlank: true),
//            Seat(id: 3, type: .premium, name: "1C"),
//            Seat(id: 4, type: .moreSpace, name: "1"),
//            Seat(id: 5, type: .premium, name: "1D"),
//            Seat(id: 6, type: .premium, name: "1E"),
//            Seat(id: 7, type: .premium, name: "1F"),
//            Seat(id: 8, type: .premium, name: "2A"),
//            Seat(id: 9, type: .premium, name: "2B"),
//            Seat(id: 10, type: .premium, name: "2C"),
//            Seat(id: 11, type: .moreSpace, name: "2"),
//            Seat(id: 12, type: .premium, name: "2D"),
//            Seat(id: 13, type: .premium, name: "2E"),
//            Seat(id: 14, type: .premium, name: "2F"),
//        ]
//        
//        let standarSeats = [
//            Seat(id: 15, type: .premium, name: "3A"),
//            Seat(id: 16, type: .premium, name: "3B", isBlank: true),
//            Seat(id: 17, type: .premium, name: "3C"),
//            Seat(id: 18, type: .moreSpace, name: "3"),
//            Seat(id: 19, type: .premium, name: "3D"),
//            Seat(id: 20, type: .premium, name: "3E"),
//            Seat(id: 21, type: .premium, name: "3F"),
//            Seat(id: 22, type: .premium, name: "4A"),
//            Seat(id: 23, type: .premium, name: "4B"),
//            Seat(id: 24, type: .premium, name: "4C"),
//            Seat(id: 25, type: .moreSpace, name: "4"),
//            Seat(id: 26, type: .premium, name: "4D"),
//            Seat(id: 27, type: .premium, name: "4E"),
//            Seat(id: 28, type: .premium, name: "4F"),
//        ]
//        
//        
//        
//        sectionSeats.updateValue(premiumSeats, forKey: .premium)
    }
    
    func selectSeat(_ seat: Seat, index: Int) {
        guard seat.type != .hallway && !seat.isBlank else { return }
        
        sectionSeats[seat.type]?[index].isSelected = !seat.isSelected
    }
}

enum SeatType: Identifiable {
    var id: String {
        section
    }
    
    case premium
    case standard
    case moreSpace
    case comfort
    case hallway
    
    var section: String {
        switch self {
        case .premium:
            return "Premium"
        case .standard:
            return "Salida rapida"
        case .moreSpace:
            return "ASD"
        case .comfort:
            return "Estandar"
        case .hallway:
            return "Hallway"
        }
    }
}

struct Seat: Identifiable {
    let id: Int
    let type: SeatType
    let name: String
    let isBlocked: Bool
    let price: Decimal
    let isBlank: Bool
    var isSelected: Bool
    
    init(id: Int, type: SeatType, name: String, isBlocked: Bool = false, price: Decimal = 0.0, isBlank: Bool = false, isSelected: Bool = false) {
        self.id = id
        self.type = type
        self.name = name
        self.isBlocked = isBlocked
        self.price = price
        self.isBlank = isBlank
        self.isSelected = isSelected
    }
}
