import glenvy/env

pub type Environment {
  Environment(hostname: String, service_did: String)
}

pub fn fetch_environment() -> Result(Environment, String) {
  case
    env.get_string("BSKY_FEED_HOSTNAME"),
    env.get_string("BSKY_FEED_SERVICE_DID")
  {
    Ok(hostname), Ok(service_did) -> Ok(Environment(hostname, service_did))
    Error(Nil), Error(Nil) ->
      Error("Please define BSKY_FEED_HOSTNAME, BSKY_FEED_SERVICE_DID")
    Error(Nil), _ -> Error("Please define BSKY_FEED_HOSTNAME")
    _, Error(Nil) -> Error("Please define BSKY_FEED_SERVICE_DID")
  }
}
