let s = React.string

open Belt
@val external document: {..} = "document"

type state = {posts: array<Post.t>, forDeletion: Map.String.t<Js.Global.timeoutId>}

type action =
  | DeleteLater(Post.t, Js.Global.timeoutId)
  | DeleteAbort(Post.t)
  | DeleteNow(Post.t)

let reducer = (state, action) =>
  switch action {
  | DeleteLater(post, timeoutId) => {
      posts: state.posts,
      forDeletion: Map.String.set(state.forDeletion, post->Post.id, timeoutId),
    }
  | DeleteAbort(post) => {
      switch Map.String.get(state.forDeletion, post->Post.id) {
      | Some(intervalId) => Js.Global.clearTimeout(intervalId)
      | None => Js.log("Some error occurred")
      }
      {
        posts: state.posts,
        forDeletion: Map.String.remove(state.forDeletion, post->Post.id),
      }
    }
  | DeleteNow(post) => {
      switch Map.String.get(state.forDeletion, post->Post.id) {
      | Some(intervalId) => Js.Global.clearTimeout(intervalId)
      | None => Js.log("Some error occurred")
      }
      let (newArr, _) = Belt.Array.partition(state.posts, x => x != post)
      {posts: newArr, forDeletion: Map.String.remove(state.forDeletion, post->Post.id)}
    }
  }

let initialState = {posts: Post.examples, forDeletion: Map.String.empty}

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)

  let elements = state.posts->Array.map(post =>
    if Map.String.has(state.forDeletion, post->Post.id) {
      <NewBlock
        post
        key={post->Post.id}
        restoreHandle={_mouseEvt => dispatch(DeleteAbort(post))}
        deleteHandle={_mouseEvt => dispatch(DeleteNow(post))}
      />
    } else {
      <OriginalBlock
        post
        key={post->Post.id}
        deleteHandle={_mouseEvt =>
          dispatch(DeleteLater(post, Js.Global.setTimeout(() => dispatch(DeleteNow(post)), 10000)))}
      />
    }
  )

  <div className="max-w-3xl mx-auto mt-8 relative"> {elements->React.array} </div>
}
