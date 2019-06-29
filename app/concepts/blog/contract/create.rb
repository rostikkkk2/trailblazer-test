module Blog::Contract
  class Create < Reform::Form
    property :title

    validates :title, length: 2..20
  end
end
