describe "The CSL Style Repository" do

  it "contains independent styles" do
    Independents.should_not be_empty
  end

  it "contains dependent styles" do
    Dependents.should_not be_empty
  end

  it "does not contain any duplicate file names" do
    (Independents.keys & Dependents.keys).should == []
  end

  it "contains no duplicate ISSNs" do
    ISSN.select { |_, styles| styles.length > 1 }.should == {}
  end

  it "contains no duplicate style titles" do
    TITLES.select { |_, styles| styles.length > 1 }.should == {}
  end

  it "contains no extra files" do
    EXTRA_FILES.should == []
  end
end
