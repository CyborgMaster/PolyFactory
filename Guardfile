guard :shell do
  watch(%r{src/factory/.+\.coffee}) do
    `iced -I inline -j build/factory.js -c src/factory`
    'factory.js recompiled'
  end

  watch(%r{src/[^/]+\.coffee}) do |m|
    `iced -I inline -o build -c #{m[0]}`
    "#{m[0]} recompiled"
  end
end
