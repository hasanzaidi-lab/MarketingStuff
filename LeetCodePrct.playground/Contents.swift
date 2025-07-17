

import UIKit


class Solution {
    func arithmeticTriplets(_ nums: [Int], _ diff: Int) -> Int {
        var i = 0
        var j = 1
        var k = 2
        while i < j {
            if abs(nums[i] - nums[j]) != diff {
                j += 1
            } 
        }
    }
}


print(Solution().arithmeticTriplets([1,2,3,4,5,7,8,9,10], 2))
