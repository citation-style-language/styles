Dependents.each_pair do |basename, (filename, path, style, reason)|

  describe "dependent/#{basename}:" do

    it "must validate against the CSL 1.0.1 schema" do
      expect(CSL.validate(path)).to eq([])
    end

    it "must have a conventional file name" do
      expect(filename).to match(/^[a-z\d]+(-[a-z\d]+)*\.csl$/)
    end

    it "must be parsable as a CSL style" do
      expect(style).to be_a(CSL::Style), reason
    end

    unless style.nil?
      it "must be a dependent style (independent styles must be placed in the root directory)" do
        expect(style).to be_dependent
      end

      it "must have an <info/> element" do
       expect(style).to have_info
      end

      it 'may not have <macro/>, <citation/>, or <bibliography/> elements' do
        expect(style).not_to have_macro
        expect(style).not_to have_citation
        expect(style).not_to have_bibliography
      end

      it '"self" link must match the style ID' do
        if style.has_self_link?
          expect(style.id).to eq(style.self_link)
        end
      end

      it 'may not have a "template" link' do
        expect(style).not_to have_template_link
      end

      it "must have a style ID" do
        expect(style).to have_id
      end

      it 'style ID must be of the form "http://www.zotero.org/styles/" + style file name (without ".csl" extension, e.g. "http://www.zotero.org/styles/apa")' do
        expect(style.id).to eq("http://www.zotero.org/styles/#{basename}")
      end

      it "must have a <rights> element" do
        expect(style.info).to have_rights
      end

      it "must have the correct Creative Commons BY-SA license" do
        expect(style).to be_default_license
      end

      it '"independent-parent" link must point to an existing independent style' do
        link = style.independent_parent_link

        expect(link).to match(%r{http[s]?://www.zotero.org/styles/([a-z-]+)})
        expect(Independents).to have_key(link[/[^\/]+$/])
      end

      it "must have at least one <category/> element" do
        expect(style.info).to have_categories
      end

      it "must define a citation-format" do
        expect(style.citation_format).not_to be_nil
      end

      it "must have the same citation-format as its independent-parent" do
        parent = style.independent_parent_link[/[^\/]+$/]
        parent = Independents[parent][-1]

        expect(style.citation_format).to eq(parent.citation_format)
      end

    end
  end
end
