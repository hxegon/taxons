require 'tree'

class Taxons
  attr_reader :taxonomies

  def initialize(taxonomies = [])
    @taxonomies = {}
    taxonomies.to_a.each(&method(:add))
  end

  def add(taxon)
    fail "#{taxon} is not a Taxon!" unless taxon.is_a? Taxon
    @taxonomies[taxon.name.to_sym] = taxon
  end

  def add_new(name, content = { id: nil })
    add(Taxon.new(name, content))
  end

  def [](arg)
    return @taxonomies[arg.to_sym] # unless arg.is_a? Array # for path accessing
  end

  def with_id
    @taxonomies.each_value.flat_map(&:with_id)
  end

  def without_id
    @taxonomies.each_value.flat_map(&:without_id)
  end

  class Taxon < Tree::TreeNode
    def initialize(name, content = { id: nil })
      super(name, content)
    end

    def add(taxon)
      fail "#{taxon} is not a Taxon!" unless taxon.is_a? Taxon
      super(taxon)
    end

    def add_new(name, content = { id: nil })
      add(self.class.new(name, content))
    end

    def with_id
      each.select(&:id).flatten
    end

    def without_id
      each.reject(&:id).flatten
    end

    def id
      content[:id]
    end

    def id= value
      content[:id] = value
    end
  end
end