let s = React.string

@react.component
let make = (~post, ~restoreHandle, ~deleteHandle) => {
  <div className="relative bg-yellow-100 px-8 py-4 mb-4 h-40">
    <p className="text-center white mb-1">
      {s(
        `This post from ${post->Post.title} by ${post->Post.author} will be permanently removed in 10 seconds.`,
      )}
    </p>
    <div className="flex justify-center">
      <Button
        className="mr-4 mt-4 bg-yellow-500 hover:bg-yellow-900 text-white py-2 px-4"
        text="Restore"
        handleClick=restoreHandle
      />
      <Button
        className="mr-4 mt-4 bg-red-500 hover:bg-red-900 text-white py-2 px-4"
        text="Delete Immediately"
        handleClick=deleteHandle
      />
    </div>
    <div className="bg-red-500 h-2 w-full absolute top-0 left-0 progress" />
  </div>
}
