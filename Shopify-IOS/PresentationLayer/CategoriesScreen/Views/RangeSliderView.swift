import SwiftUI

struct RangeSliderView: View {
    @Binding var range: ClosedRange<Double>
    let bounds: ClosedRange<Double>
    
    // Computed property to ensure valid bounds
    private var validBounds: ClosedRange<Double> {
        guard bounds.lowerBound < bounds.upperBound else {
            return 0...100 // Fallback to a valid range
        }
        return bounds
    }
    
    // Computed property to ensure valid range
    private var validRange: ClosedRange<Double> {
        let clampedLower = max(range.lowerBound, validBounds.lowerBound)
        let clampedUpper = min(range.upperBound, validBounds.upperBound)
        
        // Ensure lower bound is less than upper bound
        if clampedLower >= clampedUpper {
            let mid = (validBounds.lowerBound + validBounds.upperBound) / 2
            return validBounds.lowerBound...mid
        }
        
        return clampedLower...clampedUpper
    }

    var body: some View {
        VStack(spacing: 10) {
            Text("Min: \(Int(validRange.lowerBound))    Max: \(Int(validRange.upperBound))")
                .font(.caption)
                .foregroundColor(.gray)
            // Upper bound slider
            VStack(alignment: .leading, spacing: 4) {
                Text("Maximum")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                Slider(
                    value: Binding(
                        get: { validRange.upperBound },
                        set: { newValue in
                            let clamped = max(newValue, validRange.lowerBound + 1)
                            let finalValue = min(clamped, validBounds.upperBound)
                            range = validRange.lowerBound...finalValue
                        }
                    ),
                    in: (validBounds.lowerBound + 1)...validBounds.upperBound,
                    step: 1
                )
            }
           
        }
        .padding()
        .background(Color.forBackground)
        .onAppear {
            // Validate and fix the range on appear
            let correctedRange = validRange
            if correctedRange != range {
                range = correctedRange
            }
        }
    }
}
