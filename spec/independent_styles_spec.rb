Independents.each_pair do |id, (filename, path, style)|

  describe "independent style #{id}" do
    
    it "is a valid CSL 1.0 style" do
      CSL.validate(path).should == []
    end

    it "has a conventional file name" do
      filename.should match(/^[a-z\d]+(-[a-z\d]+)*\.csl$/)
    end

    it "was successfully parsed" do
      style.should be_a(CSL::Style)
    end

    unless style.nil?
      it "is independent" do
        style.should be_independent
      end

      it "has an info element" do
       style.should have_info
      end

      it "has a self-link" do
        style.should have_self_link
      end

      it "has an id" do
        style.info.should have_id
      end

      it "the self-link is a valid style repository link" do
        style.self_link.should == "http://www.zotero.org/styles/#{id}"
      end

      it "the self-link matches the style id" do
        style.id.should == style.self_link
      end

      it "has and info/rights element" do
        style.info.should have_rights
      end

      it "is licensed under a CC BY-SA license" do
        (style.info.rights.text == 'This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License' && style.info.rights[:license].should == 'http://creativecommons.org/licenses/by-sa/3.0/').should be_true
      end

      it "its template-link (if present) points to an existing independent style" do
        if style.has_template_link?
          link = style.template_link

          link.should match(%r{http://www.zotero.org/styles/([a-z-]+)})
          Independents.should have_key(link[/[^\/]+$/])
        end
      end

      unless %w{ all bibtex blank national-archives-of-australia }.include?(id)
        it "has at least one info/category" do
          style.info.should have_categories
        end

        it "has a citation-format" do
          style.citation_format.should_not be_nil
        end

        it "its citation-format is valid" do
          style.citation_format.to_s.should match(/^author(-date)?|numeric|label|note/)
        end
      end

      it "defines all macros that are referenced by text or key nodes" do
        style.descendants!.each do |node|
          if node.matches?(/^key|text$/, :macro => /./)
            style.macros.should have_key(node[:macro])
          end
        end
      end      
    end

  end
end