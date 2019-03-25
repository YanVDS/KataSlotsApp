//
//  VendorMachine.swift
//  KataSlotsApp
//
//  Created by Yannick Vanderstraeten on 22/03/2019.
//  Copyright © 2019 TeleSoftas. All rights reserved.
//

import Foundation

class VendorMachine {

    // MARK: - Coins
    var insertedCoinArray: [Coin] = []
    var machineCoinArray: [Coin] = []

    func insertNickel() {
        insertedCoinArray.append(Coin.nickel)
    }

    func insertDime() {
        insertedCoinArray.append(Coin.dime)
    }

    func insertQuarter() {
        insertedCoinArray.append(Coin.quarter)
    }

    func insertDollar() {
        insertedCoinArray.append(Coin.dollar)
    }

    func returnCoins() -> [Coin] {
        return insertedCoinArray
    }

    // MARK: - Items
    func itemA() -> String {
        var sum: Float = 0.0
        var tempArray: [Coin] = []

        for coin in insertedCoinArray {
            sum += coin.value
        }

        if sum >= 0.65 {
            let difference: Float = sum - 0.65
            var returnSum: Float = 0.0

            // sort first
            insertedCoinArray.sort(by: {$0.value > $1.value})

            for coin in insertedCoinArray {
                if (returnSum + coin.value) < difference {
                    returnSum += coin.value
                    tempArray.append(coin)
                    if returnSum == difference {
                        continue
                    }
                } else if (returnSum + coin.value) == difference {
                    tempArray.append(coin)
                    continue
                } else {
                    insertedCoinArray.removeAll()
                    return "A"
                }
            }

            insertedCoinArray.removeAll()
            for coin in tempArray {
                insertedCoinArray.append(coin)
            }
            return "A"
        }

        return "NOT ENOUGH COINS"
    }

    func itemB() -> String {
        var sum: Float = 0.0

        for coin in insertedCoinArray {
            sum += coin.value
        }

        if sum >= 1.00 {
            return "B"
        }

        return "NOT ENOUGH COINS"
    }


    func itemC() -> String {
        var sum: Float = 0.0

        for coin in insertedCoinArray {
            sum += coin.value
        }

        if sum >= 1.50 {
            return "C"
        }

        return "NOT ENOUGH COINS"
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
