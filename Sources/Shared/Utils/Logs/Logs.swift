//
//  File.swift
//  Shared
//
//  Created by partnertientm2 on 3/11/25.
//

import Foundation

public enum Log {
    enum LogLevel {
        case info
        case warning
        case error
        case context   // 👈 new log type
        
        fileprivate var prefix: String {
            switch self {
            case .info:    return "ℹ️ INFO"
            case .warning: return "⚠️ WARN"
            case .error:   return "❌ ALERT"
            case .context: return "🟢 TRACE"
            }
        }
    }
    
    struct Context {
        let file: String
        let function: String
        let line: Int
        var description: String {
            return "\((file as NSString).lastPathComponent):\(line) \(function)"
        }
    }
   
    public static func info(_ str: String, shouldLogContext: Bool = false, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        handleLog(level: .info, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func warning(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        handleLog(level: .warning, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func error(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        handleLog(level: .error, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func context(file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        handleLog(level: .context, str: context.description, shouldLogContext: false, context: context)
    }

    fileprivate static func handleLog(level: LogLevel, str: String, shouldLogContext: Bool, context: Context) {
        var fullString = "[\(level.prefix)] \(str)"
        if shouldLogContext {
            fullString += " ➜ \(context.description)"
        }
        #if DEBUG
        print(fullString)
        #endif
    }
}
