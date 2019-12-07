import hander
import json
import usecase

when isMainModule:
  "command".hander do (event: JsonNode) -> JsonNode:
    let uc = IzumiUsecase()
    let res = uc.run()
    return %* {
      "msg": res
      }

