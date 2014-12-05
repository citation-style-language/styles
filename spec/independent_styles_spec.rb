Independents.each_pair do |id, (filename, path, style)|

  describe "independent style #{id}" do

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
      it "is independent" do
        expect(style).to be_independent
      end

      it "has an info element" do
       expect(style).to have_info
      end

      it "has a self-link" do
        expect(style).to have_self_link
      end

      it "has an id" do
        expect(style.info).to have_id
      end

      it "the id is a valid style repository link" do
        expect(style.id).to eq("http://www.zotero.org/styles/#{id}")
      end

      it "the self-link is a valid style repository link" do
        expect(style.self_link).to match(%r{http[s]?://www.zotero.org/styles/#{id}})
      end

      it "has an info/rights element" do
        expect(style.info).to have_rights
      end

      it "is licensed under a CC BY-SA license" do
        expect(style).to be_default_license
      end

      it "its template-link (if present) points to an existing independent style" do
        if style.has_template_link?
          link = style.template_link

          expect(link).to match(%r{http[s]?://www.zotero.org/styles/([a-z-]+)})
          expect(Independents).to have_key(link[/[^\/]+$/])
        end
      end

      unless CITATION_FORMAT_FILTER.include?(id)
        it "has at least one info/category" do
          expect(style.info).to have_categories
        end

        it "has a citation-format" do
          expect(style.citation_format).not_to be_nil
        end

        it "its citation-format is valid" do
          expect(style.citation_format.to_s).to match(/^author(-date)?|numeric|label|note/)
        end

        it "has a valid class attribute" do
          expect(style[:class].to_s).to match(/^(note|in-text)$/)
        end

        it "its class attribute corresponds to the citation-format" do
          if style.citation_format == :note
            expect(style[:class]).to eq('note')
          else
            expect(style[:class]).to eq('in-text')
          end
        end
      end

      it "defines all macros that are referenced by text or key nodes" do
        style.descendants!.each do |node|
          if node.matches?(/^key|text$/, :macro => /./)
            expect(style.macros).to have_key(node[:macro])
          end
        end
      end

      unless UNUSED_MACROS_FILTER.include?(id)
        it "has no unused macros" do
          available_macros = style.macros.keys.sort

          used_macros = style.descendants.
            select { |node| node.attribute? :macro }.
            map    { |node| node[:macro] }.
            sort.uniq

          expect(available_macros - used_macros).to eq([])
        end
      end
    end

  end
end
