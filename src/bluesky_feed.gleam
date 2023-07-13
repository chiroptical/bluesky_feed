import gleam/erlang/process
import mist
import gleam/http.{Get}
import gleam/http/response
import gleam/bit_builder
import gleam/http/request.{Request}
import fetch_environment

fn handler(req: Request(mist.Body)) -> mist.Response {
  case req.method, request.path_segments(req) {
    Get, [] ->
      response.new(200)
      |> mist.bit_builder_response(bit_builder.from_string(
        "ATProto Feed Generator powered by Gleam",
      ))
    Get, [".well-known", "did.json"] ->
      response.new(200)
      |> mist.bit_builder_response(bit_builder.from_string("TODO"))
    Get, ["xrpc", "app.bsky.feed.describeFeedGenerator"] ->
      response.new(200)
      |> mist.bit_builder_response(bit_builder.from_string("TODO"))
    Get, ["xrpc", "app.bsky.feed.getFeedSkeleton"] ->
      response.new(200)
      |> mist.bit_builder_response(bit_builder.from_string("TODO"))
    _, _ ->
      response.new(404)
      |> mist.empty_response
  }
}

pub fn main() {
  let assert Ok(_environment) = fetch_environment.fetch_environment()
  let assert Ok(_) = mist.serve(8080, mist.handler_func(handler))
  process.sleep_forever()
}
