//  This file was automatically generated and should not be edited.

import Apollo

public final class TestQuery: GraphQLQuery {
  public let operationDefinition =
    "query test {\n  test\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("test", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(test: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "test": test])
    }

    public var test: String? {
      get {
        return resultMap["test"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "test")
      }
    }
  }
}