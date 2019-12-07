
import httpClient
import json

type
  SlackRepository* = ref object
    url: string

type
  Post* = ref object
    fallback: string
    pretext: string
    title: string
    text: string
    color: string
    footer: string
type
  payload = ref object
    attachments: array[1, Post]


proc post*(self: SlackRepository, body: array[1, Post]): string =
  var client = newHttpClient()
  let request = payload(attachments: body)
  let _ = client.postContent(self.url, body = $ %*request)
  return "ok"
