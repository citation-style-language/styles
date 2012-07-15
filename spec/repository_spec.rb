describe "The CSL Style Repository" do

  it "contains independent styles" do
    Independents.should_not be_empty
  end

  it "contains dependent styles" do
    Dependents.should_not be_empty
  end

  it "does not contain any duplicate file names" do
    (Independents.keys & Dependents.keys).should be_empty
  end
end