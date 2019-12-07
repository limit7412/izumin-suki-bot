import os
import repository

type
  IzumiUsecase* = ref object

proc run*(self: IzumiUsecase): string =
  let repo = SlackRepository(url: os.getEnv("SUCCESS_WEBHOOK_URL").string)
  return "ok"
