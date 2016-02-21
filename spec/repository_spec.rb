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
