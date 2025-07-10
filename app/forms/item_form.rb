class ItemForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :price, :decimal
  attribute :description, :string
  attribute :published, :boolean, default: false

  attr_accessor :image

  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 1000 }

  def initialize(item = nil)
    @item = item || Item.new
    attributes = @item.attributes.slice("name", "price", "description", "published")
    attributes["published"] = attributes["published"] || false
    super(attributes)
  end

  def save
    @item.assign_attributes(
      name: name,
      price: price,
      description: description,
      published: published
    )
    @item.image.attach(image) if image.present?
    @item.save
  end

  def update
    @item.assign_attributes(
      name: name,
      price: price,
      description: description,
      published: published
    )
    if image.present?
      @item.image.purge if @item.image.attached?
      @item.image.attach(image)
    end
    @item.save
  end

  def item
    @item
  end

  def persisted?
    @item.persisted?
  end

  def to_key
    @item.to_key
  end

  def to_model
    @item
  end

  def self.model_name
    @model_name ||= ActiveModel::Name.new(self, nil, "ItemForm")
  end
end
