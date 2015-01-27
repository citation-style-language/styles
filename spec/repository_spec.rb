describe "The CSL Style Repository" do

  unless ENV['CSL_TEST']
    it "contains independent styles" do
      expect(Independents).not_to be_empty
    end

    it "contains dependent styles" do
      expect(Dependents).not_to be_empty
    end
  end

  it "does not contain any duplicate file names" do
    expect(Independents.keys & Dependents.keys).to eq([])
  end

  it "contains no duplicate ISSNs" do
    expect(ISSN.select { |_, styles| styles.length > 1 }).to eq({})
  end

  it "contains no duplicate style titles" do
    expect(TITLES.select { |_, styles| styles.length > 1 }).to eq({})
  end

  it "contains no extra files" do
    expect(EXTRA_FILES).to eq([])
  end
end
