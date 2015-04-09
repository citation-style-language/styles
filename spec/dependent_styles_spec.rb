Dependents.each_pair do |id, (filename, path, style)|

  describe "dependent style #{id}" do

    it "is a valid CSL 1.0 style" do
      expect(CSL.validate(path)).to eq([])
    end

    it "has a conventional file name" do
      expect(filename).to match(/^[a-z\d]+(-[a-z\d]+)*\.csl$/)
    end

    it "was successfully parsed" do
      expect(style).to be_a(CSL::Style)
    end

    unless style.nil?
      it "is dependent" do
        expect(style).to be_dependent
      end

      it "has an info element" do
       expect(style).to have_info
      end

      it "does not have any rendering elements" do
        expect(style).not_to have_macro
        expect(style).not_to have_citation
        expect(style).not_to have_bibliography
      end

      it "the self-link (if present) is a valid style repository link" do
        if style.has_self_link?
          expect(style.self_link).to match(%r{http[s]?://www.zotero.org/styles/#{id}})
        end
      end

      it "the self-link (if present) matches the style id" do
        if style.has_self_link?
          expect(style.id).to eq(style.self_link)
        end
      end

      it "does not have a template-link" do
        expect(style).not_to have_template_link
      end

      it "has an id" do
        expect(style).to have_id
      end

      it "the id is a valid style repository link" do
        expect(style.id).to eq("http://www.zotero.org/styles/#{id}")
      end

      it "has an info/rights element" do
        expect(style.info).to have_rights
      end

      it "is licensed under a CC BY-SA license" do
        expect(style).to be_default_license
      end

      it "its independent-parent link points to an existing style" do
        link = style.independent_parent_link

        expect(link).to match(%r{http[s]?://www.zotero.org/styles/([a-z-]+)})
        expect(Independents).to have_key(link[/[^\/]+$/])
      end

      it "has at least one info/category" do
        expect(style.info).to have_categories
      end

      it "has a citation-format" do
        expect(style.citation_format).not_to be_nil
      end

      it "has the same citation-format as its independent-parent" do
        parent = style.independent_parent_link[/[^\/]+$/]
        parent = Independents[parent][-1]

        expect(style.citation_format).to eq(parent.citation_format)
      end

    end
  end
end
