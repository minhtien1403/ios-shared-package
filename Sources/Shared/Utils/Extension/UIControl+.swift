//
//  File.swift
//  Shared
//
//  Created by partnertientm2 on 6/1/26.
//

import UIKit
import Combine

public extension UIControl {
    struct EventPublisher: Publisher {
        public typealias Output = Void
        public typealias Failure = Never

        let control: UIControl
        let event: UIControl.Event

        public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Void == S.Input {
            let subscription = EventSubscription(
                subscriber: subscriber,
                control: control,
                event: event
            )
            subscriber.receive(subscription: subscription)
        }
    }

    final class EventSubscription<S: Subscriber>: Subscription where S.Input == Void {
        private var subscriber: S?
        weak private var control: UIControl?
        let event: UIControl.Event

        init(subscriber: S, control: UIControl, event: UIControl.Event) {
            self.subscriber = subscriber
            self.control = control
            self.event = event
            control.addTarget(self, action: #selector(eventHandler), for: event)
        }

        public func request(_ demand: Subscribers.Demand) {}

        public func cancel() {
            subscriber = nil
        }

        @objc private func eventHandler() {
            _ = subscriber?.receive(())
        }
    }

    func publisher(for event: UIControl.Event) -> EventPublisher {
        EventPublisher(control: self, event: event)
    }
}

