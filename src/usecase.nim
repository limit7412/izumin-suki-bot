import os
import random
import repository

type
  IzumiUsecase* = ref object

proc talk(self: IzumiUsecase): string =
  let list = @[
      "hoge",
      "fuga",
    ]
  return list[list.len.rand - 1]

proc run*(self: IzumiUsecase): string =
  let repo = SlackRepository(url: os.getEnv("SUCCESS_WEBHOOK_URL").string)
  let body = Post(text: self.talk)

  return repo.post(@[body])

proc err*(self: IzumiUsecase, err: ref Exception) =
  let repo = SlackRepository(url: os.getEnv("ALERT_WEBHOOK_URL").string)
  let message = "エラーみたい…確認してみよっか"
  let body = Post(
      fallback: message,
      pretext: "<@" & os.getEnv("SLACK_ID").string & "> " & message,
      title: err.msg,
      color: "#EB4646",
      footer: "slack-izumi-suki-bot",
    )

  let _ = repo.post(@[body])
