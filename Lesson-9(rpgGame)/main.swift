//
//  main.swift
//  Lesson-9(rpgGame)
//
//  Created by Ahmed Muvaza on 13/12/22.
//

import Foundation
var heroes = ["Warrior", "Witch",  "healer", "defender"]
let damageHeroes = [200, 300, 0, 100]
var healthHeroes = [1000,1000,1000,1500]

var heroesDeath = [String]()
var round = 0
var heroesInfo: [String:Int] = ["Warrior":0, "Witch": 0, "healer": 0, "defender": 0, "BOSS": 0]
let damageBoss = 200
var healthBoss = 5000

func game(){
//    var round = 0
//    var bossxp = 5000
//    let bossdmg = 200
    while healthBoss != 0 || heroesDeath.count == heroes.count{
        for i in 0..<heroes.count{
            
            if healthBoss == 0 || heroesDeath.count == heroes.count{
                break
            } else {
                round += 1
                if round % 2 == 0{
                    healthHeroes[i] += 200
                }
                
                healthBoss -= damageHeroes[i]
                healthHeroes[i] -= damageBoss
                

                heroesInfo[heroes[i]]! += damageHeroes[i]
                heroesInfo["BOSS"]! += damageBoss
                
            }
            
            if healthHeroes[i] == 0{
                heroesDeath.append(heroes[i])
            }
        }
    }
    
    func searchWinner(){
        if heroesDeath.count == heroes.count{
            print("Босс победил. Данные об игре: Количество раундов: \(round). Данные об игроках: \(heroesInfo)")
        } else if healthBoss == 0 && heroesDeath.count != heroes.count{
            print("Игроки победили. Данные об игре: Количество раундов: \(round). Данные об игроках: \(heroesInfo)")
        }
    }
    
    searchWinner()
}
game()
