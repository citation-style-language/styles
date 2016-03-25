describe "The CSL Style Repository" do

  unless ENV['CSL_TEST']
    it "must contain independent styles" do
      expect(Independents).not_to be_empty
    end

    it "must contain dependent styles" do
      expect(Dependents).not_to be_empty
    end
  end

  it "may not contain any duplicate file names" do
    expect(Independents.keys & Dependents.keys).to eq([])
  end

  it "may not contain any (non-excepted) duplicate ISSNs" do
    expect(ISSN.select { |_, styles| styles.length > 1 }).to eq({})
  end

  it "may not contain any duplicate style titles" do
    expect(TITLES.select { |_, styles| styles.length > 1 }).to eq({})
  end

  it 'may not contain extra files (make sure styles have a ".csl" extension)' do
    expect(EXTRA_FILES).to eq([])
  end
end

describe "The file \"renamed-styles.json\"" do
  it "must be valid JSON" do
    expect(JSON_IS_VALID).to be true
  end
  
  it "may not contain entries for styles present in the repository" do
    expect(RENAMED_STYLES_ENTRIES & (INDEPENDENTS_BASENAMES + DEPENDENTS_BASENAMES)).to eq([])
  end
  
  it "may not redirect to styles not present in the repository" do
    expect(RENAMED_STYLES_TARGETS - (INDEPENDENTS_BASENAMES + DEPENDENTS_BASENAMES)).to eq([])
  end
end
