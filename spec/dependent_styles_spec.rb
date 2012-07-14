IndependentStyles.each do |path|
  filename = File.basename(path)
  id = filename[0..-5]

  describe "dependent style #{id}" do
  end
end
