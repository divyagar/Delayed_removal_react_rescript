let s = React.string

@react.component
let make = (~post, ~deleteHandle) => {
  let text = post->Post.text
  <div
    id="block"
    className="bg-green-700 hover:bg-green-900 text-gray-300 hover:text-gray-100 px-8 py-4 mb-4">
    <h2 className="text-2xl mb-1"> {s(post->Post.title)} </h2>
    <h3 className="mb-4"> {s(post->Post.author)} </h3>
    {text
    ->Belt.Array.mapWithIndex((idx, t) =>
      <p key={post->Post.id ++ idx->Belt.Int.toString} className="mb-1 text-sm"> {s(t)} </p>
    )
    ->React.array}
    <Button
      className="mr-4 mt-4 bg-red-500 hover:bg-red-900 text-white py-2 px-4"
      text="Remove"
      handleClick=deleteHandle
    />
  </div>
}
