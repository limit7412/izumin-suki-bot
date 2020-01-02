import hander
import json
import usecase

when isMainModule:
  "command".hander do (event: JsonNode) -> JsonNode:
    let uc = IzumiUsecase()
    try:
      let res = uc.run()
      return %*{
        "statusCode": 200,
        "body": $ %*{
          "text": res,
        },
      }
    except:
      uc.err(getCurrentException())
      raise

