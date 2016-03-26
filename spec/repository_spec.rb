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
  before(:all) do
    RENAMED_STYLES_ENTRIES = []
    RENAMED_STYLES_TARGETS = []

    # Parse renamed-styles.json
    begin
      renamed_styles_file = File.read(File.join("#{STYLE_ROOT}", "renamed-styles.json"))
      renamed_styles = JSON.parse(renamed_styles_file)
      RENAMED_STYLES_JSON_IS_VALID = true
      
      RENAMED_STYLES_ENTRIES.push(*renamed_styles.keys)
      RENAMED_STYLES_TARGETS.push(*renamed_styles.values)
    rescue JSON::ParserError => e
      RENAMED_STYLES_JSON_IS_VALID = false
    end
  end
  
  it "must be valid JSON" do
    expect(RENAMED_STYLES_JSON_IS_VALID).to be true
  end
  
  it "may not contain entries for styles present in the repository" do
    expect(RENAMED_STYLES_ENTRIES & (INDEPENDENTS_BASENAMES + DEPENDENTS_BASENAMES)).to eq([])
  end
  
  it "may not redirect to styles not present in the repository" do
    expect(RENAMED_STYLES_TARGETS - (INDEPENDENTS_BASENAMES + DEPENDENTS_BASENAMES)).to eq([])
  end
end
