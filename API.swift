//  This file was automatically generated and should not be edited.

import Apollo

public struct PlayersGamePositionsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(number: Int, username: String) {
    graphQLMap = ["number": number, "username": username]
  }

  public var number: Int {
    get {
      return graphQLMap["number"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "number")
    }
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }
}

public enum GameState: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case waitingForPlayers
  case inProgress
  case completed
  case closed
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "waitingForPlayers": self = .waitingForPlayers
      case "inProgress": self = .inProgress
      case "completed": self = .completed
      case "closed": self = .closed
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .waitingForPlayers: return "waitingForPlayers"
      case .inProgress: return "inProgress"
      case .completed: return "completed"
      case .closed: return "closed"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GameState, rhs: GameState) -> Bool {
    switch (lhs, rhs) {
      case (.waitingForPlayers, .waitingForPlayers): return true
      case (.inProgress, .inProgress): return true
      case (.completed, .completed): return true
      case (.closed, .closed): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct PlayerInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(username: String) {
    graphQLMap = ["username": username]
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }
}

public final class CompleteGameMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation completeGame($input: [PlayersGamePositionsInput]) {\n  completeGame(input: $input) {\n    __typename\n    id\n    connectedPlayers {\n      __typename\n      connectedGamePosition\n      username\n    }\n    host {\n      __typename\n      connectedGamePosition\n      username\n    }\n    state\n    turns {\n      __typename\n      lastRoll\n      nextPlayer {\n        __typename\n        connectedGamePosition\n        username\n      }\n    }\n    openedSession {\n      __typename\n      id\n      createdAt\n    }\n  }\n}"

  public var input: [PlayersGamePositionsInput?]?

  public init(input: [PlayersGamePositionsInput?]? = nil) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("completeGame", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CompleteGame.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(completeGame: CompleteGame) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "completeGame": completeGame.resultMap])
    }

    public var completeGame: CompleteGame {
      get {
        return CompleteGame(unsafeResultMap: resultMap["completeGame"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "completeGame")
      }
    }

    public struct CompleteGame: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("connectedPlayers", type: .list(.nonNull(.object(ConnectedPlayer.selections)))),
        GraphQLField("host", type: .nonNull(.object(Host.selections))),
        GraphQLField("state", type: .scalar(GameState.self)),
        GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
        GraphQLField("openedSession", type: .object(OpenedSession.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, connectedPlayers: [ConnectedPlayer]? = nil, host: Host, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
        self.init(unsafeResultMap: ["__typename": "Game", "id": id, "connectedPlayers": connectedPlayers.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, "host": host.resultMap, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var connectedPlayers: [ConnectedPlayer]? {
        get {
          return (resultMap["connectedPlayers"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [ConnectedPlayer] in value.map { (value: ResultMap) -> ConnectedPlayer in ConnectedPlayer(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, forKey: "connectedPlayers")
        }
      }

      public var host: Host {
        get {
          return Host(unsafeResultMap: resultMap["host"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "host")
        }
      }

      public var state: GameState? {
        get {
          return resultMap["state"] as? GameState
        }
        set {
          resultMap.updateValue(newValue, forKey: "state")
        }
      }

      public var turns: [Turn]? {
        get {
          return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
        }
      }

      public var openedSession: OpenedSession? {
        get {
          return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
        }
      }

      public struct ConnectedPlayer: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Host: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Turn: GraphQLSelectionSet {
        public static let possibleTypes = ["Turn"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastRoll", type: .scalar(Int.self)),
          GraphQLField("nextPlayer", type: .nonNull(.object(NextPlayer.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lastRoll: Int? = nil, nextPlayer: NextPlayer) {
          self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll, "nextPlayer": nextPlayer.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lastRoll: Int? {
          get {
            return resultMap["lastRoll"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastRoll")
          }
        }

        public var nextPlayer: NextPlayer {
          get {
            return NextPlayer(unsafeResultMap: resultMap["nextPlayer"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "nextPlayer")
          }
        }

        public struct NextPlayer: GraphQLSelectionSet {
          public static let possibleTypes = ["Player"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
            GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var connectedGamePosition: Int? {
            get {
              return resultMap["connectedGamePosition"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "connectedGamePosition")
            }
          }

          public var username: GraphQLID {
            get {
              return resultMap["username"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }
        }
      }

      public struct OpenedSession: GraphQLSelectionSet {
        public static let possibleTypes = ["Session"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String) {
          self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class CreateGameMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation createGame {\n  createGame {\n    __typename\n    id\n    connectedPlayers {\n      __typename\n      connectedGamePosition\n      username\n    }\n    host {\n      __typename\n      connectedGamePosition\n      username\n    }\n    state\n    turns {\n      __typename\n      lastRoll\n      nextPlayer {\n        __typename\n        connectedGamePosition\n        username\n      }\n    }\n    openedSession {\n      __typename\n      id\n      createdAt\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createGame", type: .nonNull(.object(CreateGame.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createGame: CreateGame) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createGame": createGame.resultMap])
    }

    public var createGame: CreateGame {
      get {
        return CreateGame(unsafeResultMap: resultMap["createGame"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createGame")
      }
    }

    public struct CreateGame: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("connectedPlayers", type: .list(.nonNull(.object(ConnectedPlayer.selections)))),
        GraphQLField("host", type: .nonNull(.object(Host.selections))),
        GraphQLField("state", type: .scalar(GameState.self)),
        GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
        GraphQLField("openedSession", type: .object(OpenedSession.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, connectedPlayers: [ConnectedPlayer]? = nil, host: Host, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
        self.init(unsafeResultMap: ["__typename": "Game", "id": id, "connectedPlayers": connectedPlayers.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, "host": host.resultMap, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var connectedPlayers: [ConnectedPlayer]? {
        get {
          return (resultMap["connectedPlayers"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [ConnectedPlayer] in value.map { (value: ResultMap) -> ConnectedPlayer in ConnectedPlayer(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, forKey: "connectedPlayers")
        }
      }

      public var host: Host {
        get {
          return Host(unsafeResultMap: resultMap["host"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "host")
        }
      }

      public var state: GameState? {
        get {
          return resultMap["state"] as? GameState
        }
        set {
          resultMap.updateValue(newValue, forKey: "state")
        }
      }

      public var turns: [Turn]? {
        get {
          return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
        }
      }

      public var openedSession: OpenedSession? {
        get {
          return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
        }
      }

      public struct ConnectedPlayer: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Host: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Turn: GraphQLSelectionSet {
        public static let possibleTypes = ["Turn"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastRoll", type: .scalar(Int.self)),
          GraphQLField("nextPlayer", type: .nonNull(.object(NextPlayer.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lastRoll: Int? = nil, nextPlayer: NextPlayer) {
          self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll, "nextPlayer": nextPlayer.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lastRoll: Int? {
          get {
            return resultMap["lastRoll"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastRoll")
          }
        }

        public var nextPlayer: NextPlayer {
          get {
            return NextPlayer(unsafeResultMap: resultMap["nextPlayer"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "nextPlayer")
          }
        }

        public struct NextPlayer: GraphQLSelectionSet {
          public static let possibleTypes = ["Player"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
            GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var connectedGamePosition: Int? {
            get {
              return resultMap["connectedGamePosition"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "connectedGamePosition")
            }
          }

          public var username: GraphQLID {
            get {
              return resultMap["username"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }
        }
      }

      public struct OpenedSession: GraphQLSelectionSet {
        public static let possibleTypes = ["Session"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String) {
          self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class JoinGameMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation joinGame($id: ID) {\n  joinGame(id: $id) {\n    __typename\n    id\n    connectedPlayers {\n      __typename\n      connectedGamePosition\n      username\n    }\n    host {\n      __typename\n      connectedGamePosition\n      username\n    }\n    state\n    turns {\n      __typename\n      lastRoll\n      nextPlayer {\n        __typename\n        connectedGamePosition\n        username\n      }\n    }\n    openedSession {\n      __typename\n      id\n      createdAt\n    }\n  }\n}"

  public var id: GraphQLID?

  public init(id: GraphQLID? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("joinGame", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(JoinGame.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(joinGame: JoinGame) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "joinGame": joinGame.resultMap])
    }

    public var joinGame: JoinGame {
      get {
        return JoinGame(unsafeResultMap: resultMap["joinGame"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "joinGame")
      }
    }

    public struct JoinGame: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("connectedPlayers", type: .list(.nonNull(.object(ConnectedPlayer.selections)))),
        GraphQLField("host", type: .nonNull(.object(Host.selections))),
        GraphQLField("state", type: .scalar(GameState.self)),
        GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
        GraphQLField("openedSession", type: .object(OpenedSession.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, connectedPlayers: [ConnectedPlayer]? = nil, host: Host, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
        self.init(unsafeResultMap: ["__typename": "Game", "id": id, "connectedPlayers": connectedPlayers.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, "host": host.resultMap, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var connectedPlayers: [ConnectedPlayer]? {
        get {
          return (resultMap["connectedPlayers"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [ConnectedPlayer] in value.map { (value: ResultMap) -> ConnectedPlayer in ConnectedPlayer(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, forKey: "connectedPlayers")
        }
      }

      public var host: Host {
        get {
          return Host(unsafeResultMap: resultMap["host"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "host")
        }
      }

      public var state: GameState? {
        get {
          return resultMap["state"] as? GameState
        }
        set {
          resultMap.updateValue(newValue, forKey: "state")
        }
      }

      public var turns: [Turn]? {
        get {
          return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
        }
      }

      public var openedSession: OpenedSession? {
        get {
          return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
        }
      }

      public struct ConnectedPlayer: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Host: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Turn: GraphQLSelectionSet {
        public static let possibleTypes = ["Turn"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastRoll", type: .scalar(Int.self)),
          GraphQLField("nextPlayer", type: .nonNull(.object(NextPlayer.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lastRoll: Int? = nil, nextPlayer: NextPlayer) {
          self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll, "nextPlayer": nextPlayer.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lastRoll: Int? {
          get {
            return resultMap["lastRoll"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastRoll")
          }
        }

        public var nextPlayer: NextPlayer {
          get {
            return NextPlayer(unsafeResultMap: resultMap["nextPlayer"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "nextPlayer")
          }
        }

        public struct NextPlayer: GraphQLSelectionSet {
          public static let possibleTypes = ["Player"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
            GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var connectedGamePosition: Int? {
            get {
              return resultMap["connectedGamePosition"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "connectedGamePosition")
            }
          }

          public var username: GraphQLID {
            get {
              return resultMap["username"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }
        }
      }

      public struct OpenedSession: GraphQLSelectionSet {
        public static let possibleTypes = ["Session"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String) {
          self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class MakeTurnMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation makeTurn($roll: Int) {\n  makeTurn(roll: $roll) {\n    __typename\n    lastRoll\n    nextPlayer {\n      __typename\n      connectedGame {\n        __typename\n        id\n        state\n        openedSession {\n          __typename\n          id\n          createdAt\n        }\n      }\n      connectedGamePosition\n      username\n      createdGame {\n        __typename\n        id\n        state\n        openedSession {\n          __typename\n          id\n          createdAt\n        }\n      }\n    }\n  }\n}"

  public var roll: Int?

  public init(roll: Int? = nil) {
    self.roll = roll
  }

  public var variables: GraphQLMap? {
    return ["roll": roll]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("makeTurn", arguments: ["roll": GraphQLVariable("roll")], type: .nonNull(.object(MakeTurn.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(makeTurn: MakeTurn) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "makeTurn": makeTurn.resultMap])
    }

    public var makeTurn: MakeTurn {
      get {
        return MakeTurn(unsafeResultMap: resultMap["makeTurn"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "makeTurn")
      }
    }

    public struct MakeTurn: GraphQLSelectionSet {
      public static let possibleTypes = ["Turn"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("lastRoll", type: .scalar(Int.self)),
        GraphQLField("nextPlayer", type: .nonNull(.object(NextPlayer.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(lastRoll: Int? = nil, nextPlayer: NextPlayer) {
        self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll, "nextPlayer": nextPlayer.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var lastRoll: Int? {
        get {
          return resultMap["lastRoll"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastRoll")
        }
      }

      public var nextPlayer: NextPlayer {
        get {
          return NextPlayer(unsafeResultMap: resultMap["nextPlayer"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "nextPlayer")
        }
      }

      public struct NextPlayer: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGame", type: .object(ConnectedGame.selections)),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdGame", type: .object(CreatedGame.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGame: ConnectedGame? = nil, connectedGamePosition: Int? = nil, username: GraphQLID, createdGame: CreatedGame? = nil) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGame": connectedGame.flatMap { (value: ConnectedGame) -> ResultMap in value.resultMap }, "connectedGamePosition": connectedGamePosition, "username": username, "createdGame": createdGame.flatMap { (value: CreatedGame) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGame: ConnectedGame? {
          get {
            return (resultMap["connectedGame"] as? ResultMap).flatMap { ConnectedGame(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "connectedGame")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var createdGame: CreatedGame? {
          get {
            return (resultMap["createdGame"] as? ResultMap).flatMap { CreatedGame(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "createdGame")
          }
        }

        public struct ConnectedGame: GraphQLSelectionSet {
          public static let possibleTypes = ["Game"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("state", type: .scalar(GameState.self)),
            GraphQLField("openedSession", type: .object(OpenedSession.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, state: GameState? = nil, openedSession: OpenedSession? = nil) {
            self.init(unsafeResultMap: ["__typename": "Game", "id": id, "state": state, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var state: GameState? {
            get {
              return resultMap["state"] as? GameState
            }
            set {
              resultMap.updateValue(newValue, forKey: "state")
            }
          }

          public var openedSession: OpenedSession? {
            get {
              return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
            }
          }

          public struct OpenedSession: GraphQLSelectionSet {
            public static let possibleTypes = ["Session"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, createdAt: String) {
              self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }
          }
        }

        public struct CreatedGame: GraphQLSelectionSet {
          public static let possibleTypes = ["Game"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("state", type: .scalar(GameState.self)),
            GraphQLField("openedSession", type: .object(OpenedSession.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, state: GameState? = nil, openedSession: OpenedSession? = nil) {
            self.init(unsafeResultMap: ["__typename": "Game", "id": id, "state": state, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var state: GameState? {
            get {
              return resultMap["state"] as? GameState
            }
            set {
              resultMap.updateValue(newValue, forKey: "state")
            }
          }

          public var openedSession: OpenedSession? {
            get {
              return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
            }
          }

          public struct OpenedSession: GraphQLSelectionSet {
            public static let possibleTypes = ["Session"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, createdAt: String) {
              self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }
          }
        }
      }
    }
  }
}

public final class RegisterMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation register($input: PlayerInput!) {\n  register(input: $input) {\n    __typename\n    connectedGame {\n      __typename\n      id\n      state\n      turns {\n        __typename\n        lastRoll\n      }\n      openedSession {\n        __typename\n        id\n        createdAt\n      }\n    }\n    connectedGamePosition\n    username\n    createdGame {\n      __typename\n      id\n      state\n      turns {\n        __typename\n        lastRoll\n      }\n      openedSession {\n        __typename\n        id\n        createdAt\n      }\n    }\n  }\n}"

  public var input: PlayerInput

  public init(input: PlayerInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("register", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(Register.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(register: Register) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "register": register.resultMap])
    }

    public var register: Register {
      get {
        return Register(unsafeResultMap: resultMap["register"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "register")
      }
    }

    public struct Register: GraphQLSelectionSet {
      public static let possibleTypes = ["Player"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("connectedGame", type: .object(ConnectedGame.selections)),
        GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
        GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdGame", type: .object(CreatedGame.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(connectedGame: ConnectedGame? = nil, connectedGamePosition: Int? = nil, username: GraphQLID, createdGame: CreatedGame? = nil) {
        self.init(unsafeResultMap: ["__typename": "Player", "connectedGame": connectedGame.flatMap { (value: ConnectedGame) -> ResultMap in value.resultMap }, "connectedGamePosition": connectedGamePosition, "username": username, "createdGame": createdGame.flatMap { (value: CreatedGame) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var connectedGame: ConnectedGame? {
        get {
          return (resultMap["connectedGame"] as? ResultMap).flatMap { ConnectedGame(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "connectedGame")
        }
      }

      public var connectedGamePosition: Int? {
        get {
          return resultMap["connectedGamePosition"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "connectedGamePosition")
        }
      }

      public var username: GraphQLID {
        get {
          return resultMap["username"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var createdGame: CreatedGame? {
        get {
          return (resultMap["createdGame"] as? ResultMap).flatMap { CreatedGame(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "createdGame")
        }
      }

      public struct ConnectedGame: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("state", type: .scalar(GameState.self)),
          GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
          GraphQLField("openedSession", type: .object(OpenedSession.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
          self.init(unsafeResultMap: ["__typename": "Game", "id": id, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var state: GameState? {
          get {
            return resultMap["state"] as? GameState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var turns: [Turn]? {
          get {
            return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
          }
        }

        public var openedSession: OpenedSession? {
          get {
            return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
          }
        }

        public struct Turn: GraphQLSelectionSet {
          public static let possibleTypes = ["Turn"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastRoll", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lastRoll: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lastRoll: Int? {
            get {
              return resultMap["lastRoll"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastRoll")
            }
          }
        }

        public struct OpenedSession: GraphQLSelectionSet {
          public static let possibleTypes = ["Session"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdAt: String) {
            self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }
        }
      }

      public struct CreatedGame: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("state", type: .scalar(GameState.self)),
          GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
          GraphQLField("openedSession", type: .object(OpenedSession.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
          self.init(unsafeResultMap: ["__typename": "Game", "id": id, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var state: GameState? {
          get {
            return resultMap["state"] as? GameState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var turns: [Turn]? {
          get {
            return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
          }
        }

        public var openedSession: OpenedSession? {
          get {
            return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
          }
        }

        public struct Turn: GraphQLSelectionSet {
          public static let possibleTypes = ["Turn"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastRoll", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lastRoll: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lastRoll: Int? {
            get {
              return resultMap["lastRoll"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastRoll")
            }
          }
        }

        public struct OpenedSession: GraphQLSelectionSet {
          public static let possibleTypes = ["Session"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdAt: String) {
            self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }
        }
      }
    }
  }
}

public final class StartGameMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation startGame {\n  startGame {\n    __typename\n    id\n    connectedPlayers {\n      __typename\n      connectedGamePosition\n      username\n    }\n    host {\n      __typename\n      connectedGamePosition\n      username\n    }\n    state\n    turns {\n      __typename\n      lastRoll\n      nextPlayer {\n        __typename\n        connectedGamePosition\n        username\n      }\n    }\n    openedSession {\n      __typename\n      id\n      createdAt\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("startGame", type: .nonNull(.object(StartGame.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(startGame: StartGame) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "startGame": startGame.resultMap])
    }

    public var startGame: StartGame {
      get {
        return StartGame(unsafeResultMap: resultMap["startGame"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "startGame")
      }
    }

    public struct StartGame: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("connectedPlayers", type: .list(.nonNull(.object(ConnectedPlayer.selections)))),
        GraphQLField("host", type: .nonNull(.object(Host.selections))),
        GraphQLField("state", type: .scalar(GameState.self)),
        GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
        GraphQLField("openedSession", type: .object(OpenedSession.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, connectedPlayers: [ConnectedPlayer]? = nil, host: Host, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
        self.init(unsafeResultMap: ["__typename": "Game", "id": id, "connectedPlayers": connectedPlayers.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, "host": host.resultMap, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var connectedPlayers: [ConnectedPlayer]? {
        get {
          return (resultMap["connectedPlayers"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [ConnectedPlayer] in value.map { (value: ResultMap) -> ConnectedPlayer in ConnectedPlayer(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, forKey: "connectedPlayers")
        }
      }

      public var host: Host {
        get {
          return Host(unsafeResultMap: resultMap["host"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "host")
        }
      }

      public var state: GameState? {
        get {
          return resultMap["state"] as? GameState
        }
        set {
          resultMap.updateValue(newValue, forKey: "state")
        }
      }

      public var turns: [Turn]? {
        get {
          return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
        }
      }

      public var openedSession: OpenedSession? {
        get {
          return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
        }
      }

      public struct ConnectedPlayer: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Host: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Turn: GraphQLSelectionSet {
        public static let possibleTypes = ["Turn"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastRoll", type: .scalar(Int.self)),
          GraphQLField("nextPlayer", type: .nonNull(.object(NextPlayer.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lastRoll: Int? = nil, nextPlayer: NextPlayer) {
          self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll, "nextPlayer": nextPlayer.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lastRoll: Int? {
          get {
            return resultMap["lastRoll"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastRoll")
          }
        }

        public var nextPlayer: NextPlayer {
          get {
            return NextPlayer(unsafeResultMap: resultMap["nextPlayer"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "nextPlayer")
          }
        }

        public struct NextPlayer: GraphQLSelectionSet {
          public static let possibleTypes = ["Player"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
            GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var connectedGamePosition: Int? {
            get {
              return resultMap["connectedGamePosition"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "connectedGamePosition")
            }
          }

          public var username: GraphQLID {
            get {
              return resultMap["username"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }
        }
      }

      public struct OpenedSession: GraphQLSelectionSet {
        public static let possibleTypes = ["Session"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String) {
          self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class StartSessionMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation startSession {\n  startSession {\n    __typename\n    id\n    createdAt\n    currentGame {\n      __typename\n      id\n      connectedPlayers {\n        __typename\n        connectedGamePosition\n        username\n      }\n      host {\n        __typename\n        connectedGamePosition\n        username\n      }\n      state\n      turns {\n        __typename\n        lastRoll\n        nextPlayer {\n          __typename\n          connectedGamePosition\n          username\n        }\n      }\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("startSession", type: .nonNull(.object(StartSession.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(startSession: StartSession) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "startSession": startSession.resultMap])
    }

    public var startSession: StartSession {
      get {
        return StartSession(unsafeResultMap: resultMap["startSession"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "startSession")
      }
    }

    public struct StartSession: GraphQLSelectionSet {
      public static let possibleTypes = ["Session"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("currentGame", type: .object(CurrentGame.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: String, currentGame: CurrentGame? = nil) {
        self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt, "currentGame": currentGame.flatMap { (value: CurrentGame) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var currentGame: CurrentGame? {
        get {
          return (resultMap["currentGame"] as? ResultMap).flatMap { CurrentGame(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "currentGame")
        }
      }

      public struct CurrentGame: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("connectedPlayers", type: .list(.nonNull(.object(ConnectedPlayer.selections)))),
          GraphQLField("host", type: .nonNull(.object(Host.selections))),
          GraphQLField("state", type: .scalar(GameState.self)),
          GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, connectedPlayers: [ConnectedPlayer]? = nil, host: Host, state: GameState? = nil, turns: [Turn]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Game", "id": id, "connectedPlayers": connectedPlayers.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, "host": host.resultMap, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var connectedPlayers: [ConnectedPlayer]? {
          get {
            return (resultMap["connectedPlayers"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [ConnectedPlayer] in value.map { (value: ResultMap) -> ConnectedPlayer in ConnectedPlayer(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, forKey: "connectedPlayers")
          }
        }

        public var host: Host {
          get {
            return Host(unsafeResultMap: resultMap["host"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "host")
          }
        }

        public var state: GameState? {
          get {
            return resultMap["state"] as? GameState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var turns: [Turn]? {
          get {
            return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
          }
        }

        public struct ConnectedPlayer: GraphQLSelectionSet {
          public static let possibleTypes = ["Player"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
            GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var connectedGamePosition: Int? {
            get {
              return resultMap["connectedGamePosition"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "connectedGamePosition")
            }
          }

          public var username: GraphQLID {
            get {
              return resultMap["username"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }
        }

        public struct Host: GraphQLSelectionSet {
          public static let possibleTypes = ["Player"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
            GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var connectedGamePosition: Int? {
            get {
              return resultMap["connectedGamePosition"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "connectedGamePosition")
            }
          }

          public var username: GraphQLID {
            get {
              return resultMap["username"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }
        }

        public struct Turn: GraphQLSelectionSet {
          public static let possibleTypes = ["Turn"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastRoll", type: .scalar(Int.self)),
            GraphQLField("nextPlayer", type: .nonNull(.object(NextPlayer.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lastRoll: Int? = nil, nextPlayer: NextPlayer) {
            self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll, "nextPlayer": nextPlayer.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lastRoll: Int? {
            get {
              return resultMap["lastRoll"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastRoll")
            }
          }

          public var nextPlayer: NextPlayer {
            get {
              return NextPlayer(unsafeResultMap: resultMap["nextPlayer"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "nextPlayer")
            }
          }

          public struct NextPlayer: GraphQLSelectionSet {
            public static let possibleTypes = ["Player"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
              GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var connectedGamePosition: Int? {
              get {
                return resultMap["connectedGamePosition"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "connectedGamePosition")
              }
            }

            public var username: GraphQLID {
              get {
                return resultMap["username"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "username")
              }
            }
          }
        }
      }
    }
  }
}

public final class GetLastGameWaitingForPlayersQuery: GraphQLQuery {
  public let operationDefinition =
    "query getLastGameWaitingForPlayers {\n  getLastGameWaitingForPlayers {\n    __typename\n    id\n    connectedPlayers {\n      __typename\n      connectedGamePosition\n      username\n    }\n    host {\n      __typename\n      connectedGamePosition\n      username\n    }\n    state\n    turns {\n      __typename\n      lastRoll\n      nextPlayer {\n        __typename\n        connectedGamePosition\n        username\n      }\n    }\n    openedSession {\n      __typename\n      id\n      createdAt\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getLastGameWaitingForPlayers", type: .object(GetLastGameWaitingForPlayer.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getLastGameWaitingForPlayers: GetLastGameWaitingForPlayer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getLastGameWaitingForPlayers": getLastGameWaitingForPlayers.flatMap { (value: GetLastGameWaitingForPlayer) -> ResultMap in value.resultMap }])
    }

    public var getLastGameWaitingForPlayers: GetLastGameWaitingForPlayer? {
      get {
        return (resultMap["getLastGameWaitingForPlayers"] as? ResultMap).flatMap { GetLastGameWaitingForPlayer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getLastGameWaitingForPlayers")
      }
    }

    public struct GetLastGameWaitingForPlayer: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("connectedPlayers", type: .list(.nonNull(.object(ConnectedPlayer.selections)))),
        GraphQLField("host", type: .nonNull(.object(Host.selections))),
        GraphQLField("state", type: .scalar(GameState.self)),
        GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
        GraphQLField("openedSession", type: .object(OpenedSession.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, connectedPlayers: [ConnectedPlayer]? = nil, host: Host, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
        self.init(unsafeResultMap: ["__typename": "Game", "id": id, "connectedPlayers": connectedPlayers.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, "host": host.resultMap, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var connectedPlayers: [ConnectedPlayer]? {
        get {
          return (resultMap["connectedPlayers"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [ConnectedPlayer] in value.map { (value: ResultMap) -> ConnectedPlayer in ConnectedPlayer(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ConnectedPlayer]) -> [ResultMap] in value.map { (value: ConnectedPlayer) -> ResultMap in value.resultMap } }, forKey: "connectedPlayers")
        }
      }

      public var host: Host {
        get {
          return Host(unsafeResultMap: resultMap["host"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "host")
        }
      }

      public var state: GameState? {
        get {
          return resultMap["state"] as? GameState
        }
        set {
          resultMap.updateValue(newValue, forKey: "state")
        }
      }

      public var turns: [Turn]? {
        get {
          return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
        }
      }

      public var openedSession: OpenedSession? {
        get {
          return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
        }
      }

      public struct ConnectedPlayer: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Host: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }

      public struct Turn: GraphQLSelectionSet {
        public static let possibleTypes = ["Turn"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastRoll", type: .scalar(Int.self)),
          GraphQLField("nextPlayer", type: .nonNull(.object(NextPlayer.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lastRoll: Int? = nil, nextPlayer: NextPlayer) {
          self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll, "nextPlayer": nextPlayer.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lastRoll: Int? {
          get {
            return resultMap["lastRoll"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastRoll")
          }
        }

        public var nextPlayer: NextPlayer {
          get {
            return NextPlayer(unsafeResultMap: resultMap["nextPlayer"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "nextPlayer")
          }
        }

        public struct NextPlayer: GraphQLSelectionSet {
          public static let possibleTypes = ["Player"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
            GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(connectedGamePosition: Int? = nil, username: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Player", "connectedGamePosition": connectedGamePosition, "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var connectedGamePosition: Int? {
            get {
              return resultMap["connectedGamePosition"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "connectedGamePosition")
            }
          }

          public var username: GraphQLID {
            get {
              return resultMap["username"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }
        }
      }

      public struct OpenedSession: GraphQLSelectionSet {
        public static let possibleTypes = ["Session"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String) {
          self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

public final class GetLastTurnQuery: GraphQLQuery {
  public let operationDefinition =
    "query getLastTurn {\n  getLastTurn {\n    __typename\n    lastRoll\n    nextPlayer {\n      __typename\n      connectedGame {\n        __typename\n        id\n        state\n        openedSession {\n          __typename\n          id\n          createdAt\n        }\n      }\n      connectedGamePosition\n      username\n      createdGame {\n        __typename\n        id\n        state\n        openedSession {\n          __typename\n          id\n          createdAt\n        }\n      }\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getLastTurn", type: .nonNull(.object(GetLastTurn.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getLastTurn: GetLastTurn) {
      self.init(unsafeResultMap: ["__typename": "Query", "getLastTurn": getLastTurn.resultMap])
    }

    public var getLastTurn: GetLastTurn {
      get {
        return GetLastTurn(unsafeResultMap: resultMap["getLastTurn"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getLastTurn")
      }
    }

    public struct GetLastTurn: GraphQLSelectionSet {
      public static let possibleTypes = ["Turn"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("lastRoll", type: .scalar(Int.self)),
        GraphQLField("nextPlayer", type: .nonNull(.object(NextPlayer.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(lastRoll: Int? = nil, nextPlayer: NextPlayer) {
        self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll, "nextPlayer": nextPlayer.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var lastRoll: Int? {
        get {
          return resultMap["lastRoll"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastRoll")
        }
      }

      public var nextPlayer: NextPlayer {
        get {
          return NextPlayer(unsafeResultMap: resultMap["nextPlayer"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "nextPlayer")
        }
      }

      public struct NextPlayer: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("connectedGame", type: .object(ConnectedGame.selections)),
          GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
          GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdGame", type: .object(CreatedGame.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(connectedGame: ConnectedGame? = nil, connectedGamePosition: Int? = nil, username: GraphQLID, createdGame: CreatedGame? = nil) {
          self.init(unsafeResultMap: ["__typename": "Player", "connectedGame": connectedGame.flatMap { (value: ConnectedGame) -> ResultMap in value.resultMap }, "connectedGamePosition": connectedGamePosition, "username": username, "createdGame": createdGame.flatMap { (value: CreatedGame) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var connectedGame: ConnectedGame? {
          get {
            return (resultMap["connectedGame"] as? ResultMap).flatMap { ConnectedGame(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "connectedGame")
          }
        }

        public var connectedGamePosition: Int? {
          get {
            return resultMap["connectedGamePosition"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "connectedGamePosition")
          }
        }

        public var username: GraphQLID {
          get {
            return resultMap["username"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var createdGame: CreatedGame? {
          get {
            return (resultMap["createdGame"] as? ResultMap).flatMap { CreatedGame(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "createdGame")
          }
        }

        public struct ConnectedGame: GraphQLSelectionSet {
          public static let possibleTypes = ["Game"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("state", type: .scalar(GameState.self)),
            GraphQLField("openedSession", type: .object(OpenedSession.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, state: GameState? = nil, openedSession: OpenedSession? = nil) {
            self.init(unsafeResultMap: ["__typename": "Game", "id": id, "state": state, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var state: GameState? {
            get {
              return resultMap["state"] as? GameState
            }
            set {
              resultMap.updateValue(newValue, forKey: "state")
            }
          }

          public var openedSession: OpenedSession? {
            get {
              return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
            }
          }

          public struct OpenedSession: GraphQLSelectionSet {
            public static let possibleTypes = ["Session"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, createdAt: String) {
              self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }
          }
        }

        public struct CreatedGame: GraphQLSelectionSet {
          public static let possibleTypes = ["Game"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("state", type: .scalar(GameState.self)),
            GraphQLField("openedSession", type: .object(OpenedSession.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, state: GameState? = nil, openedSession: OpenedSession? = nil) {
            self.init(unsafeResultMap: ["__typename": "Game", "id": id, "state": state, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var state: GameState? {
            get {
              return resultMap["state"] as? GameState
            }
            set {
              resultMap.updateValue(newValue, forKey: "state")
            }
          }

          public var openedSession: OpenedSession? {
            get {
              return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
            }
          }

          public struct OpenedSession: GraphQLSelectionSet {
            public static let possibleTypes = ["Session"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, createdAt: String) {
              self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }
          }
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  public let operationDefinition =
    "query me {\n  me {\n    __typename\n    connectedGame {\n      __typename\n      id\n      state\n      turns {\n        __typename\n        lastRoll\n      }\n      openedSession {\n        __typename\n        id\n        createdAt\n      }\n    }\n    connectedGamePosition\n    username\n    createdGame {\n      __typename\n      id\n      state\n      turns {\n        __typename\n        lastRoll\n      }\n      openedSession {\n        __typename\n        id\n        createdAt\n      }\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", type: .nonNull(.object(Me.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.resultMap])
    }

    public var me: Me {
      get {
        return Me(unsafeResultMap: resultMap["me"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes = ["Player"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("connectedGame", type: .object(ConnectedGame.selections)),
        GraphQLField("connectedGamePosition", type: .scalar(Int.self)),
        GraphQLField("username", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdGame", type: .object(CreatedGame.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(connectedGame: ConnectedGame? = nil, connectedGamePosition: Int? = nil, username: GraphQLID, createdGame: CreatedGame? = nil) {
        self.init(unsafeResultMap: ["__typename": "Player", "connectedGame": connectedGame.flatMap { (value: ConnectedGame) -> ResultMap in value.resultMap }, "connectedGamePosition": connectedGamePosition, "username": username, "createdGame": createdGame.flatMap { (value: CreatedGame) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var connectedGame: ConnectedGame? {
        get {
          return (resultMap["connectedGame"] as? ResultMap).flatMap { ConnectedGame(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "connectedGame")
        }
      }

      public var connectedGamePosition: Int? {
        get {
          return resultMap["connectedGamePosition"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "connectedGamePosition")
        }
      }

      public var username: GraphQLID {
        get {
          return resultMap["username"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var createdGame: CreatedGame? {
        get {
          return (resultMap["createdGame"] as? ResultMap).flatMap { CreatedGame(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "createdGame")
        }
      }

      public struct ConnectedGame: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("state", type: .scalar(GameState.self)),
          GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
          GraphQLField("openedSession", type: .object(OpenedSession.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
          self.init(unsafeResultMap: ["__typename": "Game", "id": id, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var state: GameState? {
          get {
            return resultMap["state"] as? GameState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var turns: [Turn]? {
          get {
            return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
          }
        }

        public var openedSession: OpenedSession? {
          get {
            return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
          }
        }

        public struct Turn: GraphQLSelectionSet {
          public static let possibleTypes = ["Turn"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastRoll", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lastRoll: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lastRoll: Int? {
            get {
              return resultMap["lastRoll"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastRoll")
            }
          }
        }

        public struct OpenedSession: GraphQLSelectionSet {
          public static let possibleTypes = ["Session"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdAt: String) {
            self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }
        }
      }

      public struct CreatedGame: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("state", type: .scalar(GameState.self)),
          GraphQLField("turns", type: .list(.nonNull(.object(Turn.selections)))),
          GraphQLField("openedSession", type: .object(OpenedSession.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, state: GameState? = nil, turns: [Turn]? = nil, openedSession: OpenedSession? = nil) {
          self.init(unsafeResultMap: ["__typename": "Game", "id": id, "state": state, "turns": turns.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, "openedSession": openedSession.flatMap { (value: OpenedSession) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var state: GameState? {
          get {
            return resultMap["state"] as? GameState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var turns: [Turn]? {
          get {
            return (resultMap["turns"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Turn] in value.map { (value: ResultMap) -> Turn in Turn(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Turn]) -> [ResultMap] in value.map { (value: Turn) -> ResultMap in value.resultMap } }, forKey: "turns")
          }
        }

        public var openedSession: OpenedSession? {
          get {
            return (resultMap["openedSession"] as? ResultMap).flatMap { OpenedSession(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "openedSession")
          }
        }

        public struct Turn: GraphQLSelectionSet {
          public static let possibleTypes = ["Turn"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastRoll", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lastRoll: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Turn", "lastRoll": lastRoll])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lastRoll: Int? {
            get {
              return resultMap["lastRoll"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastRoll")
            }
          }
        }

        public struct OpenedSession: GraphQLSelectionSet {
          public static let possibleTypes = ["Session"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdAt: String) {
            self.init(unsafeResultMap: ["__typename": "Session", "id": id, "createdAt": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }
        }
      }
    }
  }
}