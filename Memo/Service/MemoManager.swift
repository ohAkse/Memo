//
//  MemoManager.swift
//  Memo
//
//  Created by 박유경 on 2023/08/08.
//

import Foundation
final class MemoManager
{
    static let Instance = MemoManager()

    func createMemo(memo : Memo) -> Void {
        MemoData.append(memo)
    }
    //텍스트 변경시 업데이트 용도
    func updateMemo(index : Int, memo : Memo){
        MemoData[index] = memo
    }
    //커스텀셀에서 스위치 바꼈을때 업데이트용도
    func updateMemo(index : Int, isOn : Bool){
        MemoData[index].switchIsOn = isOn
    }
    func deleteMemo(index : Int) {
        MemoData.remove(at: index)
    }
    func readMemo() -> [Memo]{
        return MemoData
    }
    private var MemoData : [Memo] = []
}
