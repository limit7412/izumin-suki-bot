import hander
import json
import usecase

when isMainModule:
  "command".hander do (event: JsonNode) -> JsonNode:
    let uc = IzumiUsecase()
    try:
      let res = uc.run()
      return %* {
        "msg": res
        }
    except:
      uc.err(getCurrentException())
      raise

