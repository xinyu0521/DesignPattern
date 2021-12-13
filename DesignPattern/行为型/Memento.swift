//
//  Memento.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/26.
//

/// 备忘录模式（Memento Design Partten）
/// 在不违背封装原则的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，以便之后恢复对象为先前的状态。

class InputText {
    private var text: String = ""

    func getText() -> String {
        return text
    }

    func append(_ text: String) {
        self.text.append(text)
    }

    func createSnapshot() -> Snapshot {
        return Snapshot(text)
    }

    func restoreSnapshot(_ snapshot: Snapshot) {
        text = snapshot.getText()
    }
}

class Snapshot {
    private let text: String
    init(_ text: String) {
        self.text = text
    }

    func getText() -> String {
        return text
    }
}

class SnapshotHolder {
    private var snapshots: [Snapshot] = []

    func popSnapshot() -> Snapshot {
        return snapshots.removeLast()
    }

    func pushSnapshot(_ snapshot: Snapshot) {
        snapshots.append(snapshot)
    }
}
