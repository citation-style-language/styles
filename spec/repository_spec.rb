describe "The CSL Style Repository" do

  it "contains independent styles" do
    IndependentStyles.should_not be_empty
  end

  it "contains dependent styles" do
    DependentStyles.should_not be_empty
  end

  it "does not contain any duplicate file names" do
    (IndependentStyles + DependentStyles).map { |s| File.basename(s) }.uniq.length.should ==
      (IndependentStyles.length + DependentStyles.length)
  end
end