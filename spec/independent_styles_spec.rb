Independents.each_pair do |basename, (filename, path, style, reason)|

  describe "#{basename}:" do

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
      it 'must be an independent style (dependent styles must be placed in the "dependent" subdirectory)' do
        expect(style).to be_independent
      end

      it "must have an <info/> element" do
       expect(style).to have_info
      end

      it 'must have a "self" link' do
        expect(style).to have_self_link
      end

      it "must have a style ID" do
        expect(style.info).to have_id
      end

      it 'style ID must be of the form "http://www.zotero.org/styles/" + style file name (without ".csl" extension, e.g. "http://www.zotero.org/styles/apa")' do
        expect(style.id).to eq("http://www.zotero.org/styles/#{basename}")
      end

      it '"self" link must match the style ID' do
        if style.has_self_link?
          expect(style.id).to eq(style.self_link)
        end
      end

      it "must have a <rights> element" do
        expect(style.info).to have_rights
      end

      it "must have the correct Creative Commons BY-SA license" do
        expect(style).to be_default_license
      end

      it '"template" link must point to an existing independent style' do
        if style.has_template_link?
          template_link = style.template_link
          link_prefix = "http://www.zotero.org/styles/"
          
          expect(template_link).to match(%r{^#{link_prefix}})
          parent_ID = template_link[link_prefix.length..-1]
          
          expect(Independents).to have_key(parent_ID)
        end
      end

      unless CITATION_FORMAT_FILTER.include?(basename)
        it "must have at least one <category/> element" do
          expect(style.info).to have_categories
        end

        it "must define a citation-format" do
          expect(style.citation_format).not_to be_nil
        end

        it 'must have a "class" attribute that matches the "citation-format" attribute' do
          if style.citation_format == :note
            expect(style[:class]).to eq('note')
          else
            expect(style[:class]).to eq('in-text')
          end
        end
      end

      it "must define all macros that are called by <text/> and <key/> elements" do
        style.descendants!.each do |node|
          if node.matches?(/^key|text$/, :macro => /./)
            expect(style.macros).to have_key(node[:macro])
          end
        end
      end

      unless UNUSED_MACROS_FILTER.include?(basename)
        it "may not have any unused macros" do
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
