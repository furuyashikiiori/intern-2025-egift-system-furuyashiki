class TicketContentService
  def self.generate
    Array.new(4) { SecureRandom.alphanumeric(4).upcase }.join("-")
  end
end
