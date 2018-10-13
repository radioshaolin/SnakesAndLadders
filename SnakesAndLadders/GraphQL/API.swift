//  This file was automatically generated and should not be edited.

import Apollo

public final class CreateGameMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation createGame {\n  createGame {\n    __typename\n    id\n    players {\n      __typename\n      id\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createGame", type: .object(CreateGame.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createGame: CreateGame? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createGame": createGame.flatMap { (value: CreateGame) -> ResultMap in value.resultMap }])
    }

    public var createGame: CreateGame? {
      get {
        return (resultMap["createGame"] as? ResultMap).flatMap { CreateGame(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createGame")
      }
    }

    public struct CreateGame: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("players", type: .list(.object(Player.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, players: [Player?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Game", "id": id, "players": players.flatMap { (value: [Player?]) -> [ResultMap?] in value.map { (value: Player?) -> ResultMap? in value.flatMap { (value: Player) -> ResultMap in value.resultMap } } }])
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

      public var players: [Player?]? {
        get {
          return (resultMap["players"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Player?] in value.map { (value: ResultMap?) -> Player? in value.flatMap { (value: ResultMap) -> Player in Player(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Player?]) -> [ResultMap?] in value.map { (value: Player?) -> ResultMap? in value.flatMap { (value: Player) -> ResultMap in value.resultMap } } }, forKey: "players")
        }
      }

      public struct Player: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "id": id])
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
      }
    }
  }
}

public final class CreatePlayerMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation createPlayer {\n  createPlayer {\n    __typename\n    id\n    game {\n      __typename\n      id\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createPlayer", type: .nonNull(.object(CreatePlayer.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPlayer: CreatePlayer) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPlayer": createPlayer.resultMap])
    }

    public var createPlayer: CreatePlayer {
      get {
        return CreatePlayer(unsafeResultMap: resultMap["createPlayer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createPlayer")
      }
    }

    public struct CreatePlayer: GraphQLSelectionSet {
      public static let possibleTypes = ["Player"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("game", type: .object(Game.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, game: Game? = nil) {
        self.init(unsafeResultMap: ["__typename": "Player", "id": id, "game": game.flatMap { (value: Game) -> ResultMap in value.resultMap }])
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

      public var game: Game? {
        get {
          return (resultMap["game"] as? ResultMap).flatMap { Game(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "game")
        }
      }

      public struct Game: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Game", "id": id])
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
      }
    }
  }
}

public final class JoinGameMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation joinGame($id: ID) {\n  joinGame(id: $id) {\n    __typename\n    id\n    players {\n      __typename\n      id\n    }\n  }\n}"

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
      GraphQLField("joinGame", arguments: ["id": GraphQLVariable("id")], type: .object(JoinGame.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(joinGame: JoinGame? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "joinGame": joinGame.flatMap { (value: JoinGame) -> ResultMap in value.resultMap }])
    }

    public var joinGame: JoinGame? {
      get {
        return (resultMap["joinGame"] as? ResultMap).flatMap { JoinGame(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "joinGame")
      }
    }

    public struct JoinGame: GraphQLSelectionSet {
      public static let possibleTypes = ["Game"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("players", type: .list(.object(Player.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, players: [Player?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Game", "id": id, "players": players.flatMap { (value: [Player?]) -> [ResultMap?] in value.map { (value: Player?) -> ResultMap? in value.flatMap { (value: Player) -> ResultMap in value.resultMap } } }])
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

      public var players: [Player?]? {
        get {
          return (resultMap["players"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Player?] in value.map { (value: ResultMap?) -> Player? in value.flatMap { (value: ResultMap) -> Player in Player(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Player?]) -> [ResultMap?] in value.map { (value: Player?) -> ResultMap? in value.flatMap { (value: Player) -> ResultMap in value.resultMap } } }, forKey: "players")
        }
      }

      public struct Player: GraphQLSelectionSet {
        public static let possibleTypes = ["Player"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Player", "id": id])
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
      }
    }
  }
}

public final class PlayersQuery: GraphQLQuery {
  public let operationDefinition =
    "query players($gameId: ID) {\n  players(gameId: $gameId) {\n    __typename\n    id\n    game {\n      __typename\n      id\n    }\n  }\n}"

  public var gameId: GraphQLID?

  public init(gameId: GraphQLID? = nil) {
    self.gameId = gameId
  }

  public var variables: GraphQLMap? {
    return ["gameId": gameId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("players", arguments: ["gameId": GraphQLVariable("gameId")], type: .list(.object(Player.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(players: [Player?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "players": players.flatMap { (value: [Player?]) -> [ResultMap?] in value.map { (value: Player?) -> ResultMap? in value.flatMap { (value: Player) -> ResultMap in value.resultMap } } }])
    }

    public var players: [Player?]? {
      get {
        return (resultMap["players"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Player?] in value.map { (value: ResultMap?) -> Player? in value.flatMap { (value: ResultMap) -> Player in Player(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Player?]) -> [ResultMap?] in value.map { (value: Player?) -> ResultMap? in value.flatMap { (value: Player) -> ResultMap in value.resultMap } } }, forKey: "players")
      }
    }

    public struct Player: GraphQLSelectionSet {
      public static let possibleTypes = ["Player"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("game", type: .object(Game.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, game: Game? = nil) {
        self.init(unsafeResultMap: ["__typename": "Player", "id": id, "game": game.flatMap { (value: Game) -> ResultMap in value.resultMap }])
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

      public var game: Game? {
        get {
          return (resultMap["game"] as? ResultMap).flatMap { Game(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "game")
        }
      }

      public struct Game: GraphQLSelectionSet {
        public static let possibleTypes = ["Game"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Game", "id": id])
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
      }
    }
  }
}