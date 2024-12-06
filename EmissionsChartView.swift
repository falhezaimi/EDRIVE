import SwiftUI
import Charts

struct EmissionsChartView: View {
    var emissionsData: [Double]

    var body: some View {
        Chart {
            ForEach(0..<emissionsData.count, id: \.self) { index in
                BarMark(
                    x: .value("Time", index),
                    y: .value("Emissions", emissionsData[index])
                )
            }
        }
        .frame(height: 300)
        .padding()
    }
}
