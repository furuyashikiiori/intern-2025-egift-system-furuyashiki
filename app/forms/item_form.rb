class ItemForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :price, :decimal
  attribute :description, :string
  attribute :published, :boolean, default: false

  # Active Storage 投稿画像
  attr_accessor :image

  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 1000 }

  def initialize(item = nil)
    @item = item || Item.new
    attributes = @item.attributes.slice("name", "price", "description", "published")
    # nil値を適切なデフォルト値に変換
    attributes["published"] = attributes["published"] || false
    super(attributes)
  end

  def save
    # バリデーションチェックはコントローラーで行うので、ここでは単純に保存
    @item.assign_attributes(
      name: name,
      price: price,
      description: description,
      published: published
    )
    # 画像が渡されていれば添付
    @item.image.attach(image) if image.present?
    @item.save
  end

  def update
    # バリデーションチェックはコントローラーで行うので、ここでは単純に保存
    @item.assign_attributes(
      name: name,
      price: price,
      description: description,
      published: published
    )
    # 更新時に新しい画像が指定されていれば置き換える
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
